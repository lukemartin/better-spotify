module.exports = (SB) ->

  SB.app.controller 'HomeController', [
    '$scope'
    '$http'
    ($scope, $http) ->
      console.log 'Home Controller'
  ]