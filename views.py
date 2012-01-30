# Create your views here.
from django.http import HttpResponse
from django.db import models
from models import Movie
from django.shortcuts import get_object_or_404
from django.core import serializers
import logging
import pdb
import sys
import traceback
import pprint

logger = logging.getLogger('djangoapps.logger')

def update_movie(request, pk):
  logger.debug('view update_movie called')
  m = get_object_or_404(Movie, pk=pk)
  param = request.POST.get('data','didnt find data')
  pm_title = 'not set yet'
  logger.debug('json parameter data:'+param)
#  pdb.set_trace()
  try:
    for desobj in serializers.deserialize("json", param, ensure_ascii=False):
      logger.debug('In the serialize loop')
      pm_title = desobj.object.title
      desobj.save()
  except Exception, err: 
    stack = pprint.pformat(traceback.extract_stack())
    logger.debug('An error occurred: %s' % str(err))
    logger.debug('   stack: %s' % stack)
  else:
#    return HttpResponse("You updated movie no. %s: %s." % (pk, m.title))
    return HttpResponse('{"title_fetched":"'+m.title+'", "data_param":"'+pm_title+'"}', mimetype = 'application/javascript')



