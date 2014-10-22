# Create the global
window.SB ?= {}

require './ui.coffee'

do (SB = window.SB, $ = window.jQuery) ->

  # Set the default config vars
  SB.config =
    baseHref: $('head base').attr 'href'

  # Create the angular app
  SB.app = angular.module 'spotifyBrowser', ['ngRoute']

  # Require submodules
  require('./controllers/ArtistsController.coffee') SB

  # Angular app config
  SB.app.config [
    '$routeProvider'
    '$locationProvider'
    '$compileProvider'
    ($routeProvider, $locationProvider, $compileProvider) ->

      # Add spotify protocol to safe URLs
      $compileProvider.aHrefSanitizationWhitelist /^\s*(https?|file|tel|spotify):/

      # Turn on History API
      # $locationProvider.html5Mode true

      # Configure routes
      $routeProvider
        .when('/artists',
          templateUrl: 'partials/artists.html'
          controller: 'ArtistsController'
        )
        .otherwise
          redirectTo: '/artists'
  ]