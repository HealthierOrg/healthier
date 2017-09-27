from django import forms

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

    class Meta:
        model = HealthierUser
        fields = ('username', 'country', 'city', 'phone_number', 'description', 'image', 'website')

    def clean_username(self):
        if not self.cleaned_data["username"]:
            print("No Username")
        return self.cleaned_data["username"]

    def clean(self):
        print("I got to print")
