from allauth.account.adapter import DefaultAccountAdapter
from healthier.taskapp.mailer import Mailer
from django.conf import settings


class HealthierAuthAdapter(DefaultAccountAdapter):
    def send_mail(self, template_prefix, email, context):
        template_folder = settings.TEMPLATES[0].get('DIRS')[0] + '/account/email_confirmation_signup_message.txt'
        mail = Mailer()
        user = context.get('user')
        mail.send_messages(subject='My App account verification',
                           template=template_folder,
                           context={'customer': self},
                           to_emails=[user.email])

