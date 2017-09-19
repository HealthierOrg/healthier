from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import User
from django.urls import reverse
from django.utils.timezone import now
from django.utils.translation import ugettext_lazy as _
from django.db import models
from config.utils import generate_id
from healthier.consumers.models import Consumer
from healthier.providers.managers import ProviderManager


class Provider(AbstractBaseUser):
    """Organization providing health services and sending reports to users"""

    email = models.EmailField(_('Email'), blank=False, unique=True, max_length=255, default='',
                              error_messages={'unique': 'Provider Email'})
    password = models.CharField(_('Password'), max_length=128, default='', error_messages={"required": "This field is "
                                                                                                       "required"})
    name = models.CharField(_('Provider Name'), blank=True, max_length=255)
    is_staff = models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.',
                                   verbose_name='staff status')
    date_joined = models.DateTimeField(_('Date Joined'), default=now)
    is_admin = models.BooleanField(_('Admin'), default=False)
    is_active = models.BooleanField(_('Active'), default=True)
    logo = models.ImageField(upload_to="uploads/images/providers/")
    address = models.CharField(max_length=100)
    city = models.CharField(max_length=200)
    country = models.CharField(max_length=200)
    phone_number = models.CharField(max_length=200)
    website = models.URLField(blank=True, null=True)
    healthier_ID = models.CharField(blank=False, max_length=30, default=generate_id("provider"))
    last_login = models.DateTimeField(default=now)

    objects = ProviderManager()

    USERNAME_FIELD = 'email'

    REQUIRED_FIELDS = ['password', 'name']

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('provider:details', kwargs={'name': self.name})

    def get_short_name(self):
        return self.name

    def get_full_name(self):
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
