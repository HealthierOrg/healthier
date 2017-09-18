from django.apps import AppConfig


class ProvidersConfig(AppConfig):
    name = 'healthier.providers'
    verbose_name = 'Provider'

    def ready(self):
        """Override this to put in:
            Users system checks
            Users signal registration
        """
        pass
