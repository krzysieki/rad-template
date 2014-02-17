angular.module('ControlPanel').factory('usersService', ['$http', ($http) ->
  usersService =
    data:
      users: [{"id":0,"name":"Loading ..."}]
    isLoaded: false

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
    else
      if deferred
        deferred.resolve()

  usersService.deletePlaylist = (userId) ->
    console.log('User with id ' + userId + ' is going to get deleted')
    $http.delete('./users/' + userId + '.json').success( ->
      console.log('Deleted success!')
    ).error( ->
      console.log('Delete failed')
    )

  usersService.createUser = (newUser) ->

    data =
      new_user:
        name: newUser.newUserName

    $http.post('./users.json', data).success( (data) ->
      console.log('Succesfully created user.')
      usersService.data.users.push(data)
    ).error( ->
      console.error('Failed to create new user')
    )
    return true
  return usersService
])