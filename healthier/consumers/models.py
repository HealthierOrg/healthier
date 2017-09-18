from django.contrib.auth.models import AbstractUser, User
from django.db import models
from django.utils.encoding import python_2_unicode_compatible


@python_2_unicode_compatible
class Consumer(models.Model):
    user = models.OneToOneField(User, related_name='user_profile')
    """A customer interested in health services using Healthier"""

    healthier_ID = models.CharField(max_length=30)
    phone_number = models.CharField(max_length=200)
    gender = models.CharField(max_length=5, choices=(("", "Select Gender"), ('M', "Male"), ("F", "Female"),),
                              blank=True)
    text = models.CharField(max_length=200)
    picture = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, null=True, blank=True, )

    def __str__(self):
        """Return a string representation of the model."""
        return self.healthier_ID

    def __unicode__(self):
        return self.healthier_ID

