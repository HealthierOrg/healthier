from django.contrib.auth.models import AbstractUser, User
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from django.utils.timezone import now
from django.utils.translation import ugettext_lazy as _

from config.utils import generate_id


@python_2_unicode_compatible
class Consumer(models.Model):
    user = models.OneToOneField(User, related_name='user_profile')
    """A customer interested in health services using Healthier"""

    email = models.EmailField(_('Email'), blank=False, unique=True, max_length=255, default='',
                              error_messages={'unique': 'Customer Email'})
    password = models.CharField(_('Password'), max_length=128, default='', error_messages={"required": "This field is "
                                                                                                       "required"})
    name = models.CharField(_('Customer Name'), blank=True, max_length=255)
    is_staff = models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.',
                                   verbose_name='staff status')
    date_joined = models.DateTimeField(_('Date Joined'), default=now)
    is_admin = models.BooleanField(_('Admin'), default=False)
    is_active = models.BooleanField(_('Active'), default=True)
    phone_number = models.CharField(max_length=200)
    gender = models.CharField(max_length=5, choices=(("", "Select Gender"), ('M', "Male"), ("F", "Female"),),
                              blank=True)
    text = models.CharField(max_length=200)
    healthier_ID = models.CharField(blank=False, max_length=30, default=generate_id("consumer"))
    picture = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, null=True, blank=True, )
    last_login = models.DateTimeField(default=now)

    def __str__(self):
        """Return a string representation of the model."""
        return self.healthier_ID

    def __unicode__(self):
        return self.healthier_ID

