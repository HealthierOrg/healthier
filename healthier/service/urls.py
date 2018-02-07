from django.conf.urls import url

from .views import GroupDetails, AllServiceListView, PaginatedCategoriesListView, AllCategoriesListView, GroupList

urlpatterns = [
    url(r'^categories/groups/services/(?P<group_id>\d+)/$', GroupDetails.as_view(), name='categories'),
    url(r'^categories/groups/(?P<id>\d+)$', GroupList.as_view(), name='groups'),
    url(r'^$', PaginatedCategoriesListView.as_view(), name='all'),
    url(r'^all/$', AllServiceListView.as_view(), name="all_services"),
    url(r'^categories/all/', AllCategoriesListView.as_view(), name="all_categories"),
]
