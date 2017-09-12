from django.contrib.auth.models import User
from django.db import models
from healthier.consumers.models import Consumer


class Provider(models.Model):
    """Organization providing health services and sending reports to users"""
    user = models.OneToOneField(User, related_name='provider_profile')
    name = models.CharField(max_length=30)
    logo = models.ImageField(upload_to="uploads/images/providers/")
    address = models.CharField(max_length=100)
    city = models.CharField(max_length=200)
    country = models.CharField(max_length=200)
    phone_number = models.CharField(max_length=200)
    website = models.URLField(blank=True, null=True)

    def __str__(self):
        """Return a string representation of the model."""
        return self.name


class ProviderRating(models.Model):
    """Organization providing health services and sending reports to users"""
    healthier_ID = models.ForeignKey(Consumer, on_delete=models.CASCADE, null=True, related_name='customer_rating')
    provider = models.ForeignKey(Provider, on_delete=models.CASCADE, null=True, related_name="provider_rating")
    comments = models.CharField(max_length=200, null=True, blank=True)
    dislikes = models.IntegerField(blank=True, default=0)
    likes = models.IntegerField(blank=True, default=0)

    def __str__(self):
        """Return a string representation of the model."""
        return self.likes
