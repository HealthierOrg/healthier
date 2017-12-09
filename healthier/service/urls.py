from django.conf.urls import url
from django.views.generic import TemplateView

from .views import CategoryDetails, AllServiceListView, PaginatedCategoriesListView,AllCategoriesListView

urlpatterns = [
    url(r'^categories/(?P<id>\d+)$', CategoryDetails.as_view(), name='categories'),
    url(r'^$', PaginatedCategoriesListView.as_view(), name='all'),
    url(r'^all/$', AllServiceListView.as_view(), name="all_services"),
    url(r'^categories/all/', AllCategoriesListView.as_view(), name="all_categories"),
]
