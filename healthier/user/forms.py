from django import forms
from healthier.consumers.models import Consumer
from healthier.providers.models import Provider
from healthier.user.models import HealthierUser, EmailList


class SignupForm(forms.ModelForm):
    class Meta:
        model = HealthierUser
        fields = ('account_type',)

    def signup(self, request, user):
        user.account_type = self.cleaned_data['account_type']
        user.email = self.cleaned_data['email']
        # Save the default User fields first, so you can get the User instance
        user.save()
        healthier_user = HealthierUser.objects.get(email=user.email)
        account_details = Provider(healthier_id=healthier_user) if "PRO" == user.account_type else Consumer(healthier_id=healthier_user)
        account_details.save()


class EmailListForm(forms.ModelForm):
    class Meta:
        model = EmailList
        exclude = ('is_user',)
        widgets = dict(
            email=forms.EmailInput(attrs={'class': 'optin__input', 'placeholder': 'Your e-mail address'})
        )
