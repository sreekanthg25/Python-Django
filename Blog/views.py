from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from .models import Post
import random
def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    randompost = Post.objects.order_by('?')[:4]
    return render(request, 'Blog/post_list.html', {'posts': posts,'rp':randompost[0],'randpost':randompost})

def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    randompost = Post.objects.order_by('?')[:4]
    return render(request, 'Blog/post_detail.html', {'post': post, 'randpost':randompost})
