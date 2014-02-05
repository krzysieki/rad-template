angular.module('ControlPanel').factory('currentUser', ['$http', ($http) ->

  currentUser =
    data:
      user: [{email: 'Not logged in.'}]
    isLoaded: false

  currentUser.loadUser = ->
    if !currentUser.isLoaded
      $http.get('./users.json').success( (data) ->
        currentUser.data.user = data
        currentUser.isLoaded = true
      ).error( ->
        console.error('Failed to load users.')
      )

  return currentUser

])

