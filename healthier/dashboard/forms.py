from django import forms
from django_countries.widgets import CountrySelectWidget

from healthier.user.models import HealthierUser


class AccountDetailForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        super(AccountDetailForm, self).__init__(*args, **kwargs)
        super().__init__()
        self.fields['username'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })
        self.fields['phone_number'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })
        self.fields['phone_number'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })
        self.fields['description'].widgets = forms.Textarea(attrs={
            'class': 'form-control',
        })
        self.fields['website'].widgets = forms.TextInput(attrs={
            'class': 'form-control',
        })

        self.fields['country'].widgets = CountrySelectWidget()

    class Meta:
        model = HealthierUser
        fields = ('username', 'email', 'country', 'city', 'phone_number', 'description', 'image', 'website')

    def clean(self):
        pass





