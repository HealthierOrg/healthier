from django.contrib.auth.models import User, AbstractUser, PermissionsMixin
from django.utils.timezone import now
from django.utils.translation import ugettext_lazy as _
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import (AbstractBaseUser,
                                        BaseUserManager)
from django_prices.models import PriceField
from model_utils.managers import InheritanceManager
from config.utils import generate_id


class HealthierUserManager(BaseUserManager, InheritanceManager):
    def create_user(self, email=None, password=None, **extra_fields):
        now = timezone.now()
        email = self.normalize_email(email)
        u = HealthierUser(email=email, last_login=now,
                          **extra_fields)
        u.set_password(password)
        u.save(using=self._db)
        return u

    def create_superuser(self, email, password, **extra_fields):
        u = self.create_user(email, password, **extra_fields)
        u.is_superuser = True
        u.is_admin = True
        u.is_staff = True
        u.save(using=self._db)
        return u


class HealthierUser(AbstractBaseUser, PermissionsMixin):
    def get_full_name(self):
        return str(self.username)

    def get_short_name(self):
        return str(self.username)

    email = models.EmailField(unique=True)
    objects = HealthierUserManager()

    account_choices = (
        ('PRO', 'Provider'),
        ('CON', 'Consumer'),
    )
    account_type = models.CharField(max_length=3, choices=account_choices)
    image = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, null=True,
                              blank=True)
    address = models.CharField(max_length=100)
    description = models.TextField(max_length=1000, blank=True)
    city = models.CharField(max_length=200)
    country = models.CharField(max_length=200)
    phone_number = models.CharField(max_length=200)
    website = models.URLField(blank=True, null=True)
    username = models.CharField(_('Username'), blank=True, max_length=50)
    is_staff = models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.',
                                   verbose_name='staff status')
    is_admin = models.BooleanField(_('Admin'), default=False)
    is_active = models.BooleanField(_('Active'), default=True)
    groups = models.ManyToManyField(blank=True,
                                    help_text='The groups this hospital belongs to. '
                                              'An hospital will get all permissions granted to '
                                              'each of their groups.', related_name='hospital_set',
                                    related_query_name='hospital', to='auth.Group', verbose_name='groups')
    is_logged_in = models.BooleanField(_('Logged In'), default=False)
    is_superuser = models.BooleanField(_('Superuser'), default=True)
    has_configured_account = models.BooleanField(_('Has Configured Account'), default=False)
    total_money = PriceField(currency='NGN', decimal_places=2, max_digits=12, default=0.00)
    healthier_id = models.CharField(max_length=50, default=generate_id("healthier_user"), blank=True)

    def __unicode__(self):
        return self.username

    USERNAME_FIELD = 'email'
    REQUIRED_FIELD = ['account_type']

    @property
    def image_url(self):
        if self.image and hasattr(self.image, 'url'):
            return self.image.url


class FAQ(models.Model):
    question = models.CharField(max_length=500, blank=False, default='')
    answer = models.TextField(max_length=3000, blank=False, default='')
    added_on = models.DateTimeField(default=now)

    def __unicode__(self):
        return self.question

    def __str__(self):
        return self.question


class Family(models.Model):
    head = models.ForeignKey(HealthierUser, on_delete=models.CASCADE, related_name="family_head")
    image = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100, null=True,
                              blank=True)
    username = models.CharField(_('Username'), blank=True, max_length=50)
    phone_number = models.CharField(max_length=200)
    description = models.TextField(max_length=1000, blank=True)
    healthier_id = models.CharField(max_length=50, default=generate_id("healthier_family_member"), blank=True)
    email = models.EmailField(unique=True)

    def __unicode__(self):
        return self.username

    def __str__(self):
        return self.username
