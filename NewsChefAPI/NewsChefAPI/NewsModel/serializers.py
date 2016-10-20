from rest_framework import serializers
from NewsModel.models import NewsModel


class NewsModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = NewsModel
        fields = ('id','created','firstName','lastName','email','phoneNumber')

    def create(self, validated_data):
        """
            Create and return User.
        """
        return NewsModel.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
            Update and return User.
        """
        instance.firstName = validated_data.get('firstName',instance.firstName)
        instance.lastName = validated_data.get('lastName',instance.lastName)
        instance.email = validated_data.get('email',instance.email)
        instance.phoneNumber = validated_data.get('phoneNumber',instance.phoneNumber)
        instance.save()
        return instance
