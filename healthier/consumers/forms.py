from django.forms import ModelForm, forms

from healthier.providers.models import Provider


class ConsumerRegistrationForm(ModelForm):
    class Meta:
            model = Provider
            exclude = ('name', 'logo', 'city', 'country', 'address', 'website', 'phone_number', 'is_active', 'is_admin',
                       'is_staff', 'date_joined', 'groups', 'healthier_ID', 'last_login')

    def __init__(self, *args, **kwargs):
            super(ConsumerRegistrationForm, self).__init__(*args, **kwargs)

    def clean_password(self):
        password = self.cleaned_data.get('password')
        if not password:
            raise forms.ValidationError("You must confirm your password")
        return password


