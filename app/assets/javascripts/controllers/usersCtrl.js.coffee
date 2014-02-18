@usersCtrl = ($scope, usersService, $q) ->
  $scope.currentUser = usersService.data.currentUser
  $scope.users = usersService.data.users
  usersService.loadUsers()


  $scope.prepUsers = ->
    $scope.users = usersService.data.users

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepUsers)

  usersService.loadUsers(@deferred)