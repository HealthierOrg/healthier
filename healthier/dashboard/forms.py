from django import forms

from healthier.service.models import ServiceRequests
from healthier.user.models import HealthierUser


class AccountDetailForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(AccountDetailForm, self).__init__(*args, **kwargs)
        super().__init__()
        self.fields['username'].widgets = forms.TextInput(attrs={
            'class': 'form-control'
        })
        self.fields['phone_number'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })
        self.fields['country'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })
        self.fields['description'].widgets = forms.Textarea(attrs={
            'class': 'form-control',
        })
        self.fields['website'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })
        self.fields['address'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })

    class Meta:
        model = HealthierUser
        fields = ('username', 'country', 'city', 'phone_number', 'description', 'image', 'website', 'address')

    def clean_username(self):
        if not self.cleaned_data["username"]:
            print("No Username")
        return self.cleaned_data["username"]

    def clean(self):
        print("I got to print")


class ServiceRequestConfigurationForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ServiceRequestConfigurationForm, self).__init__(*args, **kwargs)
        super().__init__()
        self.fields['price'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })
        self.fields['days_available'].widgets = forms.Select(attrs={
            'class': 'form-control',
        })
        self.fields['provision_description'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })
        self.fields['start_time_available'].widgets = forms.TimeInput(attrs={
            'class': 'form-control',
        })
        self.fields['end_time_available'].widgets = forms.TimeInput(attrs={
            'class': 'form-control',
        })

    class Meta:
        model = ServiceRequests
        fields = ('price', 'days_available', 'start_time_available', 'end_time_available', 'provision_description')

    def clean(self):
        print("I got here")
