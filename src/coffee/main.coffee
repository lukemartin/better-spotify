# Create the global
window.SB ?= {}

do (SB = window.SB) ->

  # Set the default config vars
  SB.config =
    baseHref: $('head base').attr 'href'

  # Create the angular app
  SB.app = angular.module 'spotifyBrowser', ['ngRoute']

  # Require submodules
  require('./controllers/homeController.coffee') SB

  # Angular app config
  SB.app.config [
    '$routeProvider'
    '$locationProvider'
    '$compileProvider'
    ($routeProvider, $locationProvider, $compileProvider) ->

      # Add spotify protocol to safe URLs
      $compileProvider.aHrefSanitizationWhitelist /^\s*(https?|file|tel|spotify):/

      # Turn on History API
      $locationProvider.html5Mode true

      # Configure routes
      $routeProvider
        .otherwise
          templateUrl: 'partials/home.html'
          controller: 'HomeController'
  ]