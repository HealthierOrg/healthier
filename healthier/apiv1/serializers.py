from rest_framework import serializers
from healthier.consumers.models import Consumer
from healthier.providers.models import Provider

class ConsumerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Consumer
        fields = ('email', 'password', 'name', 'gender', 'phone_number', 'picture')

class ProviderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Provider
        fields = (
            'email', 'password', 'name', 'phone_number', 'logo',
            'address', 'city', 'country', 'webiste'
            )