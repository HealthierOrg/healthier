from django.conf.urls import url

from .views import CategoryDetails, AllServiceListView, ServiceCategoryDetail

urlpatterns = [
    url(r'^(?P<id>\d+)$', CategoryDetails.as_view(), name='categories'),
    url(r'^$', AllServiceListView.as_view(), name='all'),
    url(r'categories^$', ServiceCategoryDetail.as_view(), name='category'),
]
