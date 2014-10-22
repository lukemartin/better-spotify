module.exports = (SB) ->

  SB.app.controller 'ArtistsController', [
    '$scope'
    '$http'
    ($scope, $http) ->
      console.log 'Artists Controller'
  ]