from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from django_prices.models import PriceField

from config.utils import generate_id
from healthier.user.models import HealthierUser


@python_2_unicode_compatible
class Consumer(models.Model):
    """Organization providing health services and sending reports to users"""

    user_details_id = models.OneToOneField(HealthierUser, on_delete=models.CASCADE, related_name="consumer_details")
    healthier_id = models.CharField(blank=False, max_length=30, default=generate_id("consumer"))

    def __str__(self):
        return "Consumer with email: {0}".format(self.user_details_id.email)

