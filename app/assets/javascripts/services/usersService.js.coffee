angular.module('ControlPanel').factory('usersService', ['$http', ($http) ->
  usersService =
    data:
      users: [{"id":0,"name":"Loading ..."}]
      currentUser: {"id":0, "email":"Not loaded"}
    isLoaded: false

  usersService.loadUsers = ->
    if !usersService.isLoaded
      $http.get('./users.json').success( (data) ->
        usersService.data.users = data
        usersService.isLoaded = true
        console.log('Successfully loaded users.')
      ).error( ->
          console.error('Failed to load users.')
      )

  return usersService
])