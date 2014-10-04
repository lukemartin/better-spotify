app = angular.module('betterSpotify', ['ngRoute'])

app.config(['$routeProvider', '$locationProvider', '$compileProvider', ($routeProvider, $locationProvider, $compileProvider) ->
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|file|tel|spotify):/)
  $locationProvider.html5Mode(true)
  $routeProvider
    .when('/meow',
      templateUrl: '/partials/meow.html'
    )
    .when('/artists/:id',
      templateUrl: '/partials/artist.html'
      controller: 'ArtistController'
    )
    .when('/auth',
      templateUrl: '/partials/auth.html'
      controller: 'AuthController'
    )
    .when('/authed',
      templateUrl: '/partials/meow.html'
      controller: 'AuthedController'
    )
    .when('/user',
      templateUrl: '/partials/user.html'
      controller: 'UserController'
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

app.controller('AuthController', ['$scope', '$http', ($scope, $http) ->
  clientId = '59d6d5180eca418095c49cb30bc0c3a3'
  redirectUrl = encodeURIComponent('http://lukes-imac.local:4141/authed')

  window.location = "https://accounts.spotify.com/authorize?client_id=#{clientId}&response_type=token&redirect_uri=#{redirectUrl}&scope=user-library-read user-library-modify"
])

app.controller('AuthedController', ['$scope', '$http', '$location', ($scope, $http, $location) ->
  console.log 'beep'
  hash = window.location.hash.split('&')
  accessToken = hash[0].split('=')[1]
  tokenType = hash[1].split('=')[1]
  expires = hash[2].split('=')[1]

  window.localStorage.setItem('authed', true)
  window.localStorage.setItem('accessToken', accessToken)
  window.localStorage.setItem('tokenType', tokenType)
  window.localStorage.setItem('expires', expires)

  window.location = '/user'
])

app.controller('UserController', ['$scope', '$http', ($scope, $http) ->
  getTracks = ->
    $http
      .get("https://api.spotify.com/v1/me/tracks?limit=50", {
        headers: {
          'Authorization': 'Bearer ' + window.localStorage.getItem('accessToken')
        }
      })
      .success((data) ->
        console.log data
      )
      .error((data) ->
        console.log data
        # window.location = '/auth'
      )

  $http
    .get("https://api.spotify.com/v1/me", {
      headers: {
        'Authorization': 'Bearer ' + window.localStorage.getItem('accessToken')
      }
    })
    .success((data) ->
      $scope.user = data
      getTracks()
    )
    .error((data) ->
      console.log data
      # window.location = '/auth'
    )
])