from rest_framework import serializers
from Blog.models import Post


class PostSerializer(serializers.HyperlinkedModelSerializer):
    author = serializers.ReadOnlyField(source='author.username')
    apiurl = serializers.SerializerMethodField('get_api_url')
    class Meta:
        model = Post
        fields = ('id', 'title', 'body', 'category', 'author', 'published_date','heroimage', 'optionalimage', 'url','apiurl')
        read_only_fields = ('id', 'published_date')
    def get_validation_exclusions(self):
        # Need to exclude `author` since we'll add that later based off the request
        exclusions = super(PostSerializer, self).get_validation_exclusions()
        return exclusions + ['author']
    def get_api_url(self, obj):
        return "#/post/%s" % obj.id
