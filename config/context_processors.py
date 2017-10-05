from django.conf import settings


def get_settings_variable(request):
    return settings.APPS_DIR
    variable_value = getattr(settings, variable_name)
    return {variable_name: variable_value}
