from django.forms import ModelForm
from .models import Consumer

class ConsumerForm(ModelForm):
    class Meta:
        model = Consumer
        fields =   [
            'first_name', 
            'last_name', 
            'email', 
            'phone_number', 
            'date_of_birth', 
            'gender', 
            'picture'
            ]
