angular.module('ControlPanel').factory('usersService', ['$http', ($http) ->
  usersService =
    data:
      users: [{"id":0,"name":"Loading ..."}]
      currentUser: {"id":0, "email":"Not loaded"}
    isLoaded: false

  usersService.loadCurrentUser = (deferred) ->
    $http.get('./currentuser').success( (data) ->
      usersService.data.currentUser = data
      if deferred
        deferred.resolve()
    ).error( ->
      console.error('Failed to load user')
      if deferred
        deferred.resolve()
    )

  usersService.loadUsers = (deferred) ->
    if !usersService.isLoaded
      $http.get('./users.json').success( (data) ->
        usersService.data.users = data
        usersService.isLoaded = true
        console.log('Successfully loaded users.')
        if deferred
                deferred.resolve()
      ).error( ->
          console.error('Failed to load users.')
          if deferred
                  deferred.resolve()
      )

  return usersService
])