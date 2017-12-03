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


def user_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/username/<filename>
    return 'user_{0}/{1}'.format(instance.username, filename)


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
    image = models.ImageField(upload_to=user_directory_path, height_field=None, width_field=None, max_length=100,
                              null=True,
                              blank=True)
    address = models.CharField(max_length=100)
    description = models.TextField(max_length=1000, blank=True)
    city = models.CharField(max_length=200)
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
    first_name = models.CharField(_('First Name'), max_length=200, blank=True)
    last_name = models.CharField(_('Last Name'), max_length=200, blank=True)
    bank_account_name = models.CharField(_('Bank Account Name'), max_length=400, blank=True)
    bank_name = models.CharField(_('Bank Name'), max_length=500, blank=True)
    bank_account_number = models.CharField(_('Account Number'), max_length=30, blank=True)

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
    active = models.BooleanField(default=True)
    added_on = models.DateField(default=now, blank=False)

    def __unicode__(self):
        return self.username

    def __str__(self):
        return self.username


class TermsAndCondition(models.Model):
    added_on = models.DateField(default=now, blank=False)
    text = models.TextField(max_length=5000, default='')


class HealthierUserClinicalData(models.Model):
    user = models.ForeignKey(HealthierUser, on_delete=models.CASCADE, related_name="clinical_data")
    clinic_name = models.CharField(_('Clinic Name'), blank=True, max_length=500)
    clinic_address = models.CharField(_('Clinic Address'), blank=True, max_length=500)
    clinic_email = models.EmailField(_('Clinic Email'), blank=True, max_length=500)


class HealthierUserAilmentData(models.Model):
    user = models.ForeignKey(HealthierUser, on_delete=models.CASCADE, related_name="ailment_data")
    ailment_name = models.CharField(_('Clinic Name'), blank=True, max_length=500)
    ailment_description = models.CharField(_('Clinic Address'), blank=True, max_length=500)
    ailment_medication = models.EmailField(_('Clinic Email'), blank=True, max_length=500)


class HealthierUserBloodData(models.Model):
    user = models.ForeignKey(HealthierUser, on_delete=models.CASCADE, related_name="blood_data")
    sys_blood = models.CharField(_('Systolic Blood'), blank=True, max_length=50)
    dia_blood = models.CharField(_('Diastolic Blood'), blank=True, max_length=50)
    random_blood = models.EmailField(_('Random Blood'), blank=True, max_length=50)
    fasting_blood = models.CharField(_('Fasting Blood'), blank=True, max_length=50)


class HealthierUserMiscData(models.Model):
    user = models.ForeignKey(HealthierUser, on_delete=models.CASCADE, related_name="misc_data")
    user_cholesterol = models.CharField(_('Systolic Blood'), blank=True, max_length=50)
    user_weight = models.CharField(_('Diastolic Blood'), blank=True, max_length=50)
