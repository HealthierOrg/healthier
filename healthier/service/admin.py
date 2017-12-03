from django.contrib import admin
from .models import HealthierService,ServiceRequests, \
            ServiceGroup, OrderedService, \
            ServiceReport, ServiceGroupCategory, \
            SuggestService

admin.site.register(HealthierService)
admin.site.register(ServiceReport)
admin.site.register(OrderedService)
admin.site.register(ServiceGroup)
admin.site.register(ServiceRequests)
admin.site.register(ServiceGroupCategory)
admin.site.register(SuggestService)
