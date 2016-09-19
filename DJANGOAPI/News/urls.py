from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from News import views as NewView
from django.conf.urls import include

urlpatterns = [
	url(r'^News/$', NewView.NewList.as_view()),
	url(r'^News/(?P<pk>[0-9]+)/$', NewView.NewDetail.as_view()),
	url(r'^users/$', NewView.UserList.as_view()),
	url(r'^users/(?P<pk>[0-9]+)/$', NewView.UserDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)
urlpatterns += [
	url(r'^api-auth/', include('rest_framework.urls')),
]




