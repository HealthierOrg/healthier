from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import User
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from config.utils import generate_id
from healthier.consumers.models import Consumer
from healthier.user.models import HealthierUser


@python_2_unicode_compatible
class Provider(models.Model):
    """Organization providing health services and sending reports to users"""

    user_details_id = models.OneToOneField(HealthierUser, on_delete=models.CASCADE, related_name="consumer_details")
    healthier_id = models.CharField(blank=False, max_length=30, default=generate_id("provider"))

    def __str__(self):
        return "Provider with email: {0}".format(self.user_details_id.email)


class ProviderRating(models.Model):
    """Organization providing health services and sending reports to users"""
    rated_by = models.OneToOneField(Consumer, on_delete=models.CASCADE, null=True, related_name='customer_rating')
    provider = models.OneToOneField(Provider, on_delete=models.CASCADE, null=True, related_name="provider_rating", db_column="provider_id")
    comments = models.CharField(max_length=200, null=True, blank=True)
    dislikes = models.IntegerField(blank=True, default=0)
    likes = models.IntegerField(blank=True, default=0)

    def __str__(self):
        """Return a string representation of the model."""
        return "Provider with email: {0}".format(self.provider.email)
