from django.conf.urls import url
from News import views as NewView

urlpatterns = [
	url(r'^News/$', NewView.new_list),
	url(r'^News/(?P<pk>[0-9]+)/$', NewView.new_detail),
]