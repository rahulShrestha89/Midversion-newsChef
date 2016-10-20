from NewsModel.serializers import NewsModelSerializer
from NewsModel.models import NewsModel
from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class NewsModelList(APIView):
   def get(self, request, format=None):
        NewsModels = NewsModel.objects.all()
        serializer = NewsModelSerializer(NewsModels,many=True)
        return Response(serializer.data)

   def post(self, request, format=None):
        serializer = NewsModelSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.data,status=status.HTTP_400_BAD_REQUEST)

class NewsModelDetail(APIView):
    def get_object(self,id):
        try:
            return NewsModel.objects.get(id=id)
        except NewsModel.DoesNotExist:
            raise Http404

    def get(self, request, id, format=None):
        users = self.get_object(id)
        serializer = NewsModelSerializer(users)
        return Response(serializer.data)


    def put(self, request, id, format=None):
        users = self.get_object(id)
        serializer = NewsModelSerializer(users, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return (serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    def delete(self, request, id, format=None):
        users = self.get_object(id)
        users.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

