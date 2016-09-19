from News.models import New
from News.serializers import NewSerializer
from News.serializers import UserSerializer
from django.contrib.auth.models import User
from rest_framework import generics
from rest_framework import permissions
from News.permissions import IsOwnerOrReadOnly


class NewList(generics.ListCreateAPIView):
	queryset = New.objects.all()
	serializer_class = NewSerializer
	permission_classes = (permissions.IsAuthenticatedOrReadOnly,)

	def perform_create(self, serializer):
		serializer.save(owner=self.request.user)

class NewDetail(generics.RetrieveUpdateDestroyAPIView):
	queryset = New.objects.all()
	serializer_class = NewSerializer
	permission_class = (permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly,)


class UserList(generics.ListAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer
	permission_classes = (permissions.IsAuthenticatedOrReadOnly,)


class UserDetail(generics.RetrieveAPIView):
	queryset = User.objects.all()
	serializer_class = UserSerializer




























