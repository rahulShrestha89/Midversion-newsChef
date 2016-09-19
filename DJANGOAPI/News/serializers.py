from rest_framework import serializers
from News.models import New, LANGUAGE_CHOICES, STYLE_CHOICES
from django.contrib.auth.models import User

class NewSerializer(serializers.ModelSerializer):
	class Meta:
		model = New
		fields = ('id','title','code','lineos','language','style')
	def create (self, validated_data):
		"""
			Create and return a new 'New' instance, given the validated data. 
		"""
		return New.objects.create(**validated_data)

	def update(self, instance, validated_data):
		"""
			Update and return an existing 'New' instance, given the validated data.
		"""

		instance.title = validated_data.get('title',instance.title)
		instance.code = validated_data.get('code',instance.code)
		instance.lineos = validated_data.get('lineos',instance.lineos)
		instance.language = validated_data.get('language',instance.language)
		instance.style = validated_data.get('style',instance.style)
		instance.save()
		return instance


class UserSerializer(serializers.ModelSerializer):
	owner = serializers.ReadOnlyField(source='owner.username')
	News = serializers.PrimaryKeyRelatedField(many=True, queryset=New.objects.all())
	class Meta:
		model = User
		fields = ('id','username','News','owner')
	
