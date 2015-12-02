from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    randompost = Post.objects.order_by('?')[:1]
    return render(request, 'Blog/post_list.html', {'posts': posts,'rp':randompost[0]})

def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'Blog/post_detail.html', {'post': post})
