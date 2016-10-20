from __future__ import unicode_literals

from django.db import models
from pygments.lexers import get_all_lexers


LEXERS = [item for item in get_all_lexers() if item[1]]

class NewsModel(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    firstName = models.CharField(max_length=100,blank=False,default='')
    lastName = models.CharField(max_length=100,blank=False,default='')
    email = models.EmailField(blank=False)
    phoneNumber = models.CharField(max_length=15,blank=False,default='')

    class Meta:
        ordering= ('created',)
