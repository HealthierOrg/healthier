from django.db import models
# from django.contrib.auth.models import User
from healthier.users.models import User

class Provider(models.Model):
    """Organization providing health services and sending reports to users"""
    user = models.OneToOneField(User, related_name='provider_profile')
    name = models.CharField(max_length=30)
    logo = models.ImageField(upload_to="uploads/images/providers/")
    address = models.CharField(max_length=100)
    city = models.CharField(max_length=200)
    country = models.CharField(max_length=200)
    phone_number = models.CharField(max_length=200)
    website = models.URLField(blank = True, null = True)

    def __str__(self):
        """Return a string representation of the model."""
        return self.name