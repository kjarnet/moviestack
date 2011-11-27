from django.db import models

# Create your models here.
class Movie(models.Model):
	title = models.CharField(max_length=80)
	notes = models.CharField(max_length=200)
	pub_date = models.DateTimeField('date published')
	
	def __unicode__(self):
		return self.title

class Search(models.Model):
	name = models.CharField(max_length=30)
	querystring = models.CharField(max_length=60)
	
	def __unicode__(self):
		return self.name

class Link(models.Model):
	movie = models.ForeignKey(Movie)
	url = models.CharField(max_length=200)
	description = models.CharField(max_length=200)

	def __unicode__(self):
		return self.url



