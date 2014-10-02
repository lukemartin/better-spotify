app = angular.module('betterSpotify', ['ngRoute'])

app.config(['$routeProvider', '$locationProvider', '$compileProvider', ($routeProvider, $locationProvider, $compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|file|tel|spotify):/);
  $locationProvider.html5Mode(true)
  $routeProvider
    .when('/meow',
      templateUrl: '/partials/meow.html'
    )
    .when('/artists/:id',
      templateUrl: '/partials/artist.html'
      controller: 'ArtistController'
    )
    .otherwise(
      templateUrl: '/partials/main.html'
      controller: 'HomeController'
    )
])

app.controller('HomeController', ['$scope', '$http', ($scope, $http) ->
  $scope.getArtists = (artist) ->
    $http
      .get("https://api.spotify.com/v1/search?q=#{artist}&type=artist")
      .success((data) ->
        console.log data.artists.items
        $scope.artists = data.artists.items
      )
      .error((data) ->
        console.log(data)
      )
])

app.controller('ArtistController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http
    .get("https://api.spotify.com/v1/artists/#{$routeParams.id}")
    .success((data) ->
      console.log data
      $scope.artist = data
    )
    .error((data) ->
      console.log data
    )

  $http
    .get("https://api.spotify.com/v1/artists/#{$routeParams.id}/albums?limit=50")
    .success((data) ->
      console.log data
      $scope.albums = data.items
    )
    .error((data) ->
      console.log data
    )
])