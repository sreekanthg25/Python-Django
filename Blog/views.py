from rest_framework import generics, permissions
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import User
from Blog.models import Post
from Blog.serializers import PostSerializer



class PostMixin(object):
	queryset = Post.objects.all()
	serializer_class = PostSerializer
	permission_classes = [
		permissions.AllowAny
	]

	def pre_save(self, obj):
		"""Force author to the current user on save"""
		obj.author = self.request.user
		return super(PostMixin, self).pre_save(obj)

class PostList(PostMixin, generics.ListCreateAPIView):
	pass


class PostDetail(PostMixin,generics.RetrieveUpdateDestroyAPIView):
	pass