from rest_framework import serializers
from healthier.consumers.models import Consumer
from healthier.providers.models import Provider
from healthier.service.models import BaseHealthierService


class ConsumerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Consumer
        fields = ('email', 'password', 'name', 'gender', 'phone_number', 'picture')

class ProviderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Provider
        fields = (
            'email', 'password', 'name', 'phone_number',
            'address', 'city', 'country', 'website'
            )

class HealthServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = BaseHealthierService
        fields = (
            'Category',
            'Service',
            'details',
            'cost',
            'cost_denom',
            'days_available', 
            'time_available',
            'provider_ID'
        )
