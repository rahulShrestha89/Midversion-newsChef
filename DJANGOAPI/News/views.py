from News.models import New
from News.serializers import NewSerializer
from News.serializers import UserSerializer
from django.contrib.auth.models import User
from rest_framework import generics
from rest_framework import permissions
from News.permissions import IsOwnerOrReadOnly
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.reverse import reverse
from rest_framework import renderers
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework.decorators import detail_route

# class NewList(generics.ListCreateAPIView):
# 	queryset = New.objects.all()
# 	serializer_class = NewSerializer
# 	permission_classes = (permissions.IsAuthenticatedOrReadOnly,)

# 	def perform_create(self, serializer):
# 		serializer.save(owner=self.request.user)

# class NewDetail(generics.RetrieveUpdateDestroyAPIView):
# 	queryset = New.objects.all()
# 	serializer_class = NewSerializer
# 	permission_class = (permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly,)


# class NewHighlight(generics.GenericAPIView):
# 	queryset = New.objects.all()
# 	renderer_classes = (renderers.StaticHTMLRenderer,)

# 	def get(self, request, *args, **kwargs):
# 		new = self.get_object()
# 		return Response(new.highlighted)

class NewViewSet(viewsets.ModelViewSet):
	"""
		This viewset automatically provides 'list', 'create', 'retrieve' , 'update' and 'destroy' actions.

		Additionally we also provide an extra 'highlight' action.
	"""
	queryset = New.objects.all()
	serializer_class = NewSerializer
	permission_classes = (permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly,)

	@detail_route(renderer_classes=[renderers.StaticHTMLRenderer])
	def highlight(self,request,*args,**kwargs):
			new = self.get_object()
			return Response(new.highlighted)

	def perform_create(self,serializer):
		serializer.save(owner=self.request.user)
# class UserList(generics.ListAPIView):
# 	queryset = User.objects.all()
# 	serializer_class = UserSerializer
# 	permission_classes = (permissions.IsAuthenticatedOrReadOnly,)


# class UserDetail(generics.RetrieveAPIView):
# 	queryset = User.objects.all()
# 	serializer_class = UserSerializer
class UserViewSet(viewsets.ReadOnlyModelViewSet):
	"""
		This viewset automatically provides 'list' and 'detail' actions.
	"""
	queryset = User.objects.all()
	serializer_class = UserSerializer


@api_view(['GET'])
def api_root(request, format=None):
	return Response({
		'users' : reverse('user-list', request=request, format=format),
		'News' : reverse('new-list', request=request, format=format)
		})


























