from django.db import models
from django.utils.timezone import now
from django_prices.models import PriceField

from healthier.providers.models import Provider


class ProviderFinance(models.Model):
    provider = models.ForeignKey(Provider)
    date_generated = models.DateField(default=now)
    income = PriceField(currency='NGN', decimal_places=2, max_digits=18, default=0.00)
    hit_count = models.IntegerField(default=1)
