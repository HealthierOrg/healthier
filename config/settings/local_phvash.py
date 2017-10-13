from .local import *

# Set database config

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'healthier',
        'USER': 'root',
        'PASSWORD': 'password',
        'HOST': 'localhost',  # Or an IP Address that your DB is hosted on
        'PORT': '3306',
        'OPTIONS': {
            'charset': 'utf8mb4',
        },
        'TEST': {
            'CHARSET': 'utf8mb4',
            'COLLATION': 'utf8mb4_unicode_ci',
        }
    },

}

# EMAIL
# ------------------------------------------------------------------------------
DEFAULT_FROM_EMAIL = env('DJANGO_DEFAULT_FROM_EMAIL',
                         default='Healthier <noreply@example.com>')
EMAIL_SUBJECT_PREFIX = env('DJANGO_EMAIL_SUBJECT_PREFIX', default='[Healthier]')
SERVER_EMAIL = env('DJANGO_SERVER_EMAIL', default=DEFAULT_FROM_EMAIL)

# Anymail with Mailgun
INSTALLED_APPS += ['anymail', ]
ANYMAIL = {
    'MAILGUN_API_KEY': 'key-38dc2f7755da3e77f226d7d9fb79f875',
    'MAILGUN_SENDER_DOMAIN': 'sandbox7b2bfeb65df3407c87abf92034ff2ced.mailgun.org'
}
EMAIL_BACKEND = 'anymail.backends.mailgun.MailgunBackend'
