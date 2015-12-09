angular.module('blog',[
	'ui.router',
	'blog.filters',
	'blog.postservice',
	'blog.directives',
	'blog.templates'
])
.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.when('', '/home');
    $urlRouterProvider.otherwise('/home');
    $stateProvider.state('home', {
        url: '/home',
        views:{
            "blogapp":{
                controller:'listCtrl',
                templateUrl: 'app/views/home.html',
                resolve: {
	                posts: function (PostService) {
    	                return PostService.list();
        	        }
           		}

            }
        }
    });
    $stateProvider.state('details', {
        url: '/details/:id',
        views:{
            "blogapp":{
                controller:'detailCtrl',
                templateUrl: 'app/views/details.html',
                resolve: {
                	posts: function (PostService) {
    	                return PostService.list();
        	        },
	                post: function ($stateParams,PostService) {
	                	var postId = $stateParams.id;
    	                return PostService.get(postId);
        	        }
           		}

            }
        }
    });
})
.config(function($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
})
.controller('listCtrl',function($scope,$state,posts){
   $scope.posts = posts;
   $scope.randomPost = getRandomObj(posts);
   function getRandomObj(obj){
   		return obj[Math.floor(Math.random() * obj.length)];
   }
})
.controller('detailCtrl',function($scope,$state,$rootScope,post,posts){
   $scope.post = post;
   $scope.posts = posts;
});