import pdb

from allauth.account.adapter import DefaultAccountAdapter
from allauth.socialaccount.adapter import DefaultSocialAccountAdapter
from healthier.taskapp.mailer import Mailer


class HealthierAuthAdapter(DefaultAccountAdapter):
    def send_mail(self, template_prefix, email, context):
        print(context)
        mail = Mailer()
        user = context.get('user')
        mail.send_messages(subject='My App account verification',
                           template='/home/lekanterragon/Desktop/HealthierProjects/healthier/healthier/templates/account/email_confirmation_signup_message.txt',
                           context={'customer': self},
                           to_emails=[user.email])

