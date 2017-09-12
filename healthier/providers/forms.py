from django import forms

class ProviderForm(ModelForm):
    class Meta:
        model = Consumer
        fields =   [
            'name', 
            'email', 
            'logo', 
            'adress', 
            'city', 
            'country', 
            'phone_number', 
            'website'
            ]