from rest_framework import serializers
from News.models import New, LANGUAGE_CHOICES, STYLE_CHOICES

# class NewSerializer(serializers.Serializer):
	# pk = serializers.IntegerField(read_only=True)
	# title = serializers.CharField(required=False,allow_blank=TRE,max_length=100)
	# code = serializers.CharField(style = {'base_template' : 'textarea.html'})
	# lineos = serializers.BooleanField(required=False)
	# language = serializers.ChoiceField(choices=LANGUAGE_CHOICES,default='python')
	# style = serializers.ChoiceField(choices=STYLE_CHOICES,default='friendly')

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
