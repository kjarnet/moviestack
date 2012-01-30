from django.conf.urls.defaults import patterns, include, url
from django.views.generic import DetailView, ListView
from models import Movie

urlpatterns = patterns('',
    url(r'^$', ListView.as_view(
            queryset=Movie.objects.order_by('-pub_date')[:5],
            context_object_name='movie_list',
            template_name='index.html')),
        url(r'^movie/(?P<pk>\d+).json/$', DetailView.as_view(
            model=Movie,
            template_name='movie.json')),
        url(r'^movie/(?P<pk>\d+)/update/$', 'moviestack.views.update_movie'),
)
