angular.module('blog',[
	'ui.router'
])
.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.when('', '/');
    $urlRouterProvider.otherwise('/');
    $stateProvider.state('blogapp', {
        url: '/',
        views:{
            "blogapp":{
                controller:'blogAppCtrl',
                template: '<ui-view/>'
            }
        }
    });
})
.controller('blogAppCtrl',function($scope,$state){
    
});

