from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from News.models import New
from News.serializers import NewSerializer

# Create your views here.



class JSONResponse(HttpResponse):
	def __init__(self, data, **kwargs):
		content = JSONRenderer().render(data)
		kwargs['content_type'] = 'application/json'
		super(JSONResponse, self).__init__(content,**kwargs)


@csrf_exempt	
def new_list(request):

		if request.method == 'GET':
			news = New.objects.all()
			serializer = NewSerializer(news,many=True)
			return JSONResponse(serializer.data)

		elif request.method == 'POST':
			data = JSONParser().parse(request)
			serializer = NewSerializer(data=data)
			if serializer.is_valid():
				serializer.save()
				return JSONResponse(serializer.data,status=201)
			return JSONResponse(serializer.errors,status=400)


@csrf_exempt
def new_detail(request,pk):
		try: 
			new = New.objects.get(pk=pk)
		except New.DoesNotExist:
			return HttpResponse(status=404)

		if request.method == 'GET':
			serializer = NewSerializer(new)
			return JSONResponse(serializer.data)

		elif request.method == 'PUT':
			data = JSONParser().parse(request)
			serializer = NewSerializer(new,data=data)
			if serializer.is_valid():
				serializer.save()
				return JSONResponse(serializer.data)
			return JSONResponse(serializers.errors,status=400)

		elif request.method == 'DELETE':
			new.delete()
			return HttpResponse(status=204)


#


	
	


