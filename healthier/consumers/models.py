from django.db import models
from django.utils.encoding import python_2_unicode_compatible

from config.utils import generate_id
from healthier.user.models import HealthierUser


@python_2_unicode_compatible
class Consumer(models.Model):
    """Organization providing health services and sending reports to users"""

    user_details_id = models.OneToOneField(HealthierUser, on_delete=models.CASCADE, related_name="provider_details")
    healthier_id = models.CharField(blank=False, max_length=30, default=generate_id("consumer"))
