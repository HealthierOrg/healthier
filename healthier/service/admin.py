from django.contrib import admin
from .models import HealthierService, \
            MeasuredTest, ServiceRequests, \
            ServiceGroup, OrderedService, \
            ServiceReport, ServiceReportGroup,\
            ServiceGroupCategory, SuggestService

admin.site.register(HealthierService)
admin.site.register(MeasuredTest)
admin.site.register(ServiceReport)
admin.site.register(ServiceReportGroup)
admin.site.register(OrderedService)
admin.site.register(ServiceGroup)
admin.site.register(ServiceRequests)
admin.site.register(ServiceGroupCategory)
admin.site.register(SuggestService)
