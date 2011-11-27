# Create your views here.
from django.http import HttpResponse
from moviestack.models import Movie
from django.shortcuts import get_object_or_404

def update_movie(request, pk):
	m = get_object_or_404(Movie, pk=pk)
	#return HttpResponse("You updated movie no. %s: %s." % (pk, m.title))
	return HttpResponse('{"title":"'+m.title+'"}');



