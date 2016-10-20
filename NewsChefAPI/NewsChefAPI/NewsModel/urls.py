from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from NewsModel import views

urlpatterns = [
    url(r'^Users/$',views.NewsModelList.as_view()),
    url(r'^Users/(?P<id>[0-9]+)/$',views.NewsModelDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)