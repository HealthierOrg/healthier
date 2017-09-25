<<<<<<< HEAD
from django.db import models
=======
import datetime

from django.db import models
from django.utils.timezone import now
from jsonfield import JSONField
from config.utils import generate_id
>>>>>>> 7afde39961ae4860392743a688fe635d48e77a1b
from healthier.consumers.models import Consumer
from healthier.providers.models import Provider
from django_prices.models import PriceField

DAYS_AVAILABLE_TUPLE = (
    ('EVR', 'EVERYDAY'),
    ('MON', 'MONDAYS'),
    ('TUE', 'TUESDAYS',),
    ('WED', 'WEDNESDAYS'),
    ('THU', 'THURSDAYS'),
    ('FRI', 'FRIDAYS'),
    ('SAT', 'SATURDAYS'),
    ('SUN', 'SUNDAYS')
)

<<<<<<< HEAD
class ServiceGroup(models.Model):
    # class Meta:
    #     app_label = 'service'

    """Initial services for providers to use as template"""
    Categories = models.CharField(max_length=50)
    Group = models.CharField(max_length=30)
    servicename = models.CharField(max_length=30)
    category_ID = models.CharField(max_length=30, blank=True)
    group_ID = models.CharField(max_length=30, blank=True)

    def __str__(self):
        """Return a string representation of the model."""
        return self.servicename


class HealthService(models.Model):
    """services inputed by providers"""
    sub_group = models.ForeignKey(ServiceGroup)
    Category = models.CharField(max_length=200)
    Service = models.CharField(max_length=200)
    details = models.CharField(max_length=200)
    cost = models.CharField(max_length=20)
    cost_denom = models.CharField(max_length=50)
    service_ID = models.CharField(max_length=30)
    days_available = models.CharField(max_length=100)
    time_available = models.CharField(max_length=100)
    provider_ID = models.ForeignKey(Provider, on_delete=models.CASCADE, blank=True, null=True, )
=======

class ServiceGroupCategory(models.Model):
    category_name = models.CharField(max_length=200)
    category_description = models.TextField(max_length=1000)
>>>>>>> 7afde39961ae4860392743a688fe635d48e77a1b

    def __str__(self):
        return self.category_name


<<<<<<< HEAD
class OrderedService(models.Model):
    """A paid for service request to the service organization"""
    healthier_ID = models.ForeignKey(Consumer)
    serv_ordered = models.CharField(max_length=30)
    payment_status = models.CharField(max_length=30,
                                      choices=(("", "Payment Status"), ('Paid', "P"), ('Not Paid', "NP"),), blank=True)
    cost = models.CharField(max_length=30)
    order_ID = models.CharField(max_length=30)
    preferred_date = models.DateField(auto_now=False, auto_now_add=False, )
    preferred_time = models.CharField(max_length=200)
    promo_code = models.CharField(max_length=10)
    order_date = models.DateField(auto_now=False, auto_now_add=False, )
    serv_provider = models.ForeignKey(Provider, on_delete=models.CASCADE, blank=True, null=True, )
=======
class ServiceGroup(models.Model):
    """Initial services for providers to use as template"""
    group_name = models.CharField(max_length=200)
    category = models.ForeignKey(ServiceGroupCategory, on_delete=models.CASCADE)
    group_description = models.CharField(max_length=1000)
>>>>>>> 7afde39961ae4860392743a688fe635d48e77a1b

    def __str__(self):
        """Return a string representation of the model."""
        return self.group_name


<<<<<<< HEAD
class MyHealth(models.Model):
    """A paid for service request to the service organization"""
    healthier_ID = models.ForeignKey(Consumer)
    service_date = models.DateField(auto_now=False, auto_now_add=False, )
    health_data = models.CharField(max_length=200)
    data_value = models.CharField(max_length=200)
=======
class BaseHealthierService(models.Model):
    group = models.ForeignKey(ServiceGroup, on_delete=models.CASCADE, blank=True, null=True)
    service_name = models.CharField(max_length=200)
    details = models.CharField(max_length=1000, blank=False, default='')
    service_id = models.CharField(max_length=200, default=generate_id("service"))
    provider_id = models.ForeignKey(Provider, on_delete=models.CASCADE, blank=True, null=True)
>>>>>>> 7afde39961ae4860392743a688fe635d48e77a1b

    def __str__(self):
        return self.service_name


class OrderedService(models.Model):
    """A paid for service request to the service organization"""
<<<<<<< HEAD
    healthier_ID = models.ForeignKey(Consumer)
    request_date = models.DateField(auto_now=False, auto_now_add=False, )
    request_type = models.CharField(max_length=200)
    name = models.CharField(max_length=200)
    duration = models.CharField(max_length=30)
    rate = models.CharField(max_length=30)
=======
    ordered_by = models.ForeignKey(Consumer)
    service_id = models.ForeignKey(BaseHealthierService, on_delete=models.CASCADE)
    provided_by = models.ForeignKey(Provider, on_delete=models.CASCADE, blank=True, null=True)
    payment_status = models.CharField(max_length=200,
                                      choices=(("", "Payment Status"), ('Paid', "P"), ('Not Paid', "NP"),), blank=True)
    order_id = models.CharField(max_length=200, default=generate_id("order"))
    preferred_date = models.DateField(auto_now=False, auto_now_add=False, default=DAYS_AVAILABLE_TUPLE)
    preferred_time = models.CharField(max_length=200)
    promo_code = models.CharField(max_length=200)
    order_date = models.DateTimeField(auto_now=False, auto_now_add=False)
>>>>>>> 7afde39961ae4860392743a688fe635d48e77a1b

    def __str__(self):
        """Return a string representation of the model."""
        return self.service_id


class ServiceRequests(models.Model):
    """A paid for service request to the service organization"""
<<<<<<< HEAD
    order_ID = models.ForeignKey("OrderedService")
    healthier_ID = models.ForeignKey(Consumer)
    service_ID = models.CharField(max_length=30)
    pickup_date = models.DateField(auto_now=False, auto_now_add=False, )
    pickup_address = models.CharField(max_length=30)
    pickup_city = models.CharField(max_length=30)
    destination_address = models.CharField(max_length=30)
    destination_city = models.CharField(max_length=200)
    destination_country = models.CharField(max_length=200)

    def __str__(self):
        """Return a string representation of the model."""
        return self.order_ID


class SentReport(models.Model):
    CONSULTATION = 'CO'
    VACCINE = 'VA'
    MICROBIOLOGY = 'MI'
    OTHERS = 'OT'
    REPORT_TYPE_CHOICES = (
        (CONSULTATION, 'Consultation'),
        (VACCINE, 'Vaccine'),
        (MICROBIOLOGY, 'Microbiology'),
        (OTHERS, 'Other Reports'),)
    """A paid for service request to the service organization"""
    report_type = models.CharField(max_length=50, choices=REPORT_TYPE_CHOICES, )
    order_ID = models.ForeignKey(OrderedService)
    service_date = models.DateField(auto_now=False, auto_now_add=False, )
    service_time = models.CharField(max_length=30)
    name_staff = models.CharField(max_length=50)
    presenting_complaints = models.TextField(max_length=30)
    general_findings = models.TextField(max_length=300, null=True)
    treatment_plan = models.TextField(max_length=30)
    vaccine_expirydate = models.DateField(auto_now=False, auto_now_add=False, )
    vaccine_batchnumber = models.CharField(max_length=200)
    next_appointment = models.DateField(auto_now=False, auto_now_add=False, )
    Consumer = models.ForeignKey(Consumer)
    file_upload = models.FileField(upload_to='uploads/%Y/%m/%d/', null=True)

    def __str__(self):
        """Return a string representation of the model."""
        return self.report_type


class MeasuredTest(models.Model):
    """Db for measured tests including range"""
    healthier_ID = models.ForeignKey(Consumer)
    order_ID = models.ForeignKey(OrderedService)
    service_date = models.DateField(auto_now=False, auto_now_add=False, )
    service_test = models.CharField(max_length=30)
    value = models.CharField(max_length=30)
    lower_range = models.CharField(max_length=30)
    upper_range = models.CharField(max_length=30)
=======
    request_date = models.DateTimeField(auto_now=False, auto_now_add=False, )
    requested_by = models.ForeignKey(Provider, on_delete=models.CASCADE)
    duration = models.CharField(max_length=200)
    rate = models.CharField(max_length=200)
    price = PriceField(currency='NGN', decimal_places=2, max_digits=12, default=0.00)
    service_id = models.ForeignKey(BaseHealthierService, on_delete=models.CASCADE)
    is_ordered = models.BooleanField(default=False)
    days_available = models.CharField(max_length=200, choices=DAYS_AVAILABLE_TUPLE, default='EVR')
    time_available = models.TimeField(max_length=200, default=datetime.time(16, 00))

    def __str__(self):
        """Return a string representation of the model."""
        return str(self.requested_by)


class ServiceReportGroup(models.Model):
    group_name = models.CharField(max_length=200)
    category = models.CharField(max_length=200)
    group_description = models.CharField(max_length=1000)

    def __str__(self):
        """Return a string representation of the model."""
        return self.servicename


class ServiceReport(models.Model):
    group = models.ForeignKey(ServiceGroup, on_delete=models.CASCADE)
    service_details = models.ForeignKey(BaseHealthierService, on_delete=models.CASCADE)
    extra_fields = JSONField()
    generated_on = models.DateTimeField(default=now)
    generated_by = models.ForeignKey(Provider)
    is_sent = models.BooleanField(default=False)
    file_upload = models.FileField(upload_to='uploads/%Y/%m/%d/', null=True)
>>>>>>> 7afde39961ae4860392743a688fe635d48e77a1b

    def __str__(self):
        return self.service_details


class MeasuredTest(models.Model):
    service_details = models.ForeignKey(BaseHealthierService, on_delete=models.CASCADE)
    lower_range = models.CharField(max_length=200)
    upper_range = models.CharField(max_length=200)
    measure_value = models.CharField(max_length=200)
    measured_by = models.ForeignKey(Provider, on_delete=models.CASCADE)
    measured_for = models.ForeignKey(Consumer, on_delete=models.CASCADE)
