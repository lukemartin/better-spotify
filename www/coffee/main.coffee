app = angular.module('betterSpotify', ['ngRoute'])

app.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $routeProvider
    .when('/meow',
      templateUrl: '/partials/meow.html'
    )
    .otherwise(
      templateUrl: '/partials/main.html'
    )
])

