angular.module('blog',[
	'ui.router',
	'blogs.postservice',
	'blogs.templates'
])
.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.when('', '/');
    $urlRouterProvider.otherwise('/');
    $stateProvider.state('home', {
        url: '/',
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
        url: '/post/:id',
        views:{
            "blogapp":{
                controller:'detailCtrl',
                templateUrl: 'app/views/details.html',
                resolve: {
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
});

