# extensions
from rest_framework import serializers
from django_countries.serializers import CountryFieldMixin

# local
from healthier.consumers.models import Consumer
from healthier.providers.models import Provider
from healthier.service.models import BaseHealthierService
from healthier.user.models import HealthierUser


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


class UserSerializer(CountryFieldMixin, serializers.ModelSerializer):
    class Meta:
        model = HealthierUser
        fields = (
            'email',
            'account_type',
            'username',
            'address',
            'description',
            'city',
            'country',
            'phone_number',
            'website',
            'image',
            'is_staff',
            'is_admin',
            'is_active',
            'is_logged_in',
            'is_superuser',
            'has_configured_account'
        )

    
    def create(self, validated_data):
        user = super(UserSerializer, self).create(validated_data)
        user.account_type = validated_data['account_type']
        user.email = validated_data['email']
        # Save the default User fields first, so you can get the User instance
        user.save()
        
        healthier_user = HealthierUser.objects.get(email=user.email)
        print(healthier_user.id)
        print(type(healthier_user))
        account_details = Provider(user_details_id=healthier_user) if user.account_type == "PRO" else Consumer(user_details_id=healthier_user)
        account_details.save()

        return user


class ConsumerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Consumer
        fields = (
            'healthier_id',
        )


class ProviderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Provider
        fields = (
            'healthier_id',
        )
