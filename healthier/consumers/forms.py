from django.forms import ModelForm

from healthier.consumers.models import Consumer


class ConsumerRegistrationForm(ModelForm):
    class Meta:
        model = Consumer
        exclude = ('healthier_ID', 'phone_number', 'gender', 'text', 'picture')
