from django.db import models

from django.template.defaultfilters import slugify


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    slug = models.SlugField()
    category = models.CharField(max_length=100)
    heroimage = models.ImageField(upload_to='heroimg')
    optionalimage = models.ImageField(upload_to='optionalimg')
    body = models.TextField()
    published_date = models.DateTimeField(
            blank=True, null=True)

    def save(self, *args, **kwargs):
        self.do_unique_slug()
        if not self.body:
            self.body = self.title
        super(Post, self).save(*args, **kwargs)

    def do_unique_slug(self):
        """
        Ensures that the slug is always unique for this post
        """
        if not self.id:
            # make sure we have a slug first
            if not len(self.slug.strip()):
                self.slug = slugify(self.title)

            self.slug = self.get_unique_slug(self.slug)
            return True

        return False

    def get_unique_slug(self, slug):
        """
        Iterates until a unique slug is found
        """
        orig_slug = slug
        counter = 1

        while True:
            posts = Post.objects.filter(slug=slug)
            if not posts.exists():
                return slug

            slug = '%s-%s' % (orig_slug, counter)
            counter += 1
