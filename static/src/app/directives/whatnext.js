angular.module('blog.directives',[]).directive('whatNext',function() {
  return {
    templateUrl: 'app/directives/thumbnail.html',
    restrict: 'E',
    scope: {
      list : '='
    },
    link: function($scope, ele, attr) {
      $scope.list = makerandom($scope.list);
      function makerandom(list){
        angular.forEach(list, function(value){
          value.rank = Math.random();
        });
        return list; 
      }
    }
  };
});