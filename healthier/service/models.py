from django.db import models

# Create your models here.
from healthier.consumers.models import Customer
from healthier.providers.models import Provider


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

    def __str__(self):
        """Return a string representation of the model."""
        return self.Service


class OrderedService(models.Model):
    """A paid for service request to the service organization"""
    healthier_ID = models.ForeignKey(Customer)
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

    def __str__(self):
        """Return a string representation of the model."""
        return self.serv_ordered


class MyHealth(models.Model):
    """A paid for service request to the service organization"""
    healthier_ID = models.ForeignKey(Customer)
    service_date = models.DateField(auto_now=False, auto_now_add=False, )
    health_data = models.CharField(max_length=200)
    data_value = models.CharField(max_length=200)

    def __str__(self):
        """Return a string representation of the model."""
        return self.service_date


class Requests(models.Model):
    """A paid for service request to the service organization"""
    healthier_ID = models.ForeignKey(Customer)
    request_date = models.DateField(auto_now=False, auto_now_add=False, )
    request_type = models.CharField(max_length=200)
    name = models.CharField(max_length=200)
    duration = models.CharField(max_length=30)
    rate = models.CharField(max_length=30)

    def __str__(self):
        """Return a string representation of the model."""
        return self.request_type


class AmbulReport(models.Model):
    """A paid for service request to the service organization"""
    order_ID = models.ForeignKey("OrderedService")
    healthier_ID = models.ForeignKey(Customer)
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
    customer = models.ForeignKey(Customer)
    file_upload = models.FileField(upload_to='uploads/%Y/%m/%d/', null=True)

    def __str__(self):
        """Return a string representation of the model."""
        return self.report_type


class ServiceGroup(models.Model):
    """Initial services for providers to use as template"""
    Categories = models.CharField(max_length=50)
    Group = models.CharField(max_length=30)
    servicename = models.CharField(max_length=30)
    category_ID = models.CharField(max_length=30, blank=True)
    group_ID = models.CharField(max_length=30, blank=True)

    def __str__(self):
        """Return a string representation of the model."""
        return self.servicename


class MeasuredTest(models.Model):
    """Db for measured tests including range"""
    healthier_ID = models.ForeignKey(Customer)
    order_ID = models.ForeignKey(OrderedService)
    service_date = models.DateField(auto_now=False, auto_now_add=False, )
    service_test = models.CharField(max_length=30)
    value = models.CharField(max_length=30)
    lower_range = models.CharField(max_length=30)
    upper_range = models.CharField(max_length=30)

    def __str__(self):
        """Return a string representation of the model."""
        return self.service_test
