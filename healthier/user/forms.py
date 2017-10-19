from django import forms
from healthier.consumers.models import Consumer
from healthier.providers.models import Provider
from healthier.user.models import HealthierUser


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
        print(healthier_user.id)
        print(type(healthier_user))
        account_details = Provider(healthier_id=healthier_user) if user.account_type\
                                                                   == "PRO" else Consumer(healthier_id=healthier_user)
        account_details.save()




