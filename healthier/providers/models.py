from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import User
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from django.utils.timezone import now
from django.utils.translation import ugettext_lazy as _
from config.utils import generate_id, generate_promo_id
from healthier.consumers.models import Consumer
from healthier.user.models import HealthierUser


@python_2_unicode_compatible
class Provider(models.Model):
    """Organization providing health services and sending reports to users"""

    healthier_id = models.OneToOneField(HealthierUser, on_delete=models.CASCADE, related_name="providers_detail")
    healthier_provider_id = models.CharField(blank=False, max_length=30, default=generate_id("provider"))

    def __str__(self):
        return "Provider with email: {0}".format(self.healthier_id.email)


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


class Promo(models.Model):
    promo_provider = models.ForeignKey(Provider, on_delete=models.CASCADE, related_name="promo_provider")
    promo_message = models.CharField(_('Promo Message'), blank=False, max_length=2000)
    promo_code = models.CharField(_('Promo Code'), blank=False, default=generate_promo_id, max_length=5)
    added_on = models.DateField(default=now, blank=False)
    duration = models.CharField(_('Promo Expiration Duration'), blank=False, max_length=30)
    active = models.BooleanField(default=True)
