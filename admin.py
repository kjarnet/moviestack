from django.contrib import admin
from djangoapps.moviedj.models import Movie
from djangoapps.moviedj.models import Link
from djangoapps.moviedj.models import Search

"Customization of the admin-interface for class Movie"
class MovieAdmin(admin.ModelAdmin):
    pass
admin.site.register(Movie, MovieAdmin)

admin.site.register(Link)

admin.site.register(Search)

