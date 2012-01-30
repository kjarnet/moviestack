from django.contrib import admin
from models import Movie
from models import Link
from models import Search

"Customization of the admin-interface for class Movie"
class MovieAdmin(admin.ModelAdmin):
    pass

admin.site.register(Movie, MovieAdmin)

admin.site.register(Link)

admin.site.register(Search)

