from django.db import models


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    category = models.CharField(max_length=100)
    heroimage = models.ImageField(upload_to='heroimg')
    optionalimage = models.ImageField(upload_to='optionalimg')
    body = models.TextField()
    published_date = models.DateTimeField(
            blank=True, null=True)