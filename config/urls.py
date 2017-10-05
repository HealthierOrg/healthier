from django.conf import settings
from django.conf.urls import include, url
from django.conf.urls.static import static
from django.contrib import admin
from django.views.generic import TemplateView
from django.views import defaults as default_views
from healthier.service.views import ServicesListView

urlpatterns = [
    url(r'^$', ServicesListView.as_view(template_name='pages/home.html'), name='home'),
    url(r'^about/', TemplateView.as_view(template_name='pages/about.html'), name='about'),

    # Django Admin, use {% url 'admin:index' %}
    url(settings.ADMIN_URL, admin.site.urls),

    url(r'^auth/', include('allauth.urls')),
    url(r'how/', TemplateView.as_view(template_name='pages/how.html'), name="how"),
    url(r'^dashboard/', include('healthier.dashboard.urls', namespace='dashboard')),
    url(r'^providers/', include('healthier.providers.urls', namespace='provider')),
    url(r'^services/', include('healthier.service.urls', namespace='service')),
    url(r'^consumers/', include('healthier.consumers.urls', namespace='consumer')),
    url(r'^api/', include('healthier.api.urls', namespace='api')),


] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    # This allows the error pages to be debugged during development, just visit
    # these url in browser to see how these error pages look like.
    urlpatterns += [
        url(r'^400/$', default_views.bad_request, kwargs={'exception': Exception('Bad Request!')}),
        url(r'^403/$', default_views.permission_denied, kwargs={'exception': Exception('Permission Denied')}),
        url(r'^404/$', default_views.page_not_found, kwargs={'exception': Exception('Page not Found')}),
        url(r'^500/$', default_views.server_error),
    ]
    if 'debug_toolbar' in settings.INSTALLED_APPS:
        import debug_toolbar
        urlpatterns = [
            url(r'^__debug__/', include(debug_toolbar.urls)),
        ] + urlpatterns
