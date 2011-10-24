from django.conf.urls.defaults import patterns, include, url
from django.views.generic import DetailView, ListView
from moviedj.models import Movie

urlpatterns = patterns('',
    url(r'^$', ListView.as_view(
            queryset=Movie.objects.order_by('-pub_date')[:5],
            context_object_name='movie_list',
            template_name='index.html')),
	url(r'^(?P<editMovie>\d+)/edit/$', ListView.as_view(
            queryset=Movie.objects.order_by('-pub_date')[:5],
            context_object_name='movie_list',
            template_name='index.html')),
)
