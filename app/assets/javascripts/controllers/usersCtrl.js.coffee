@usersCtrl = ($scope, usersService) ->
  $scope.currentUser = usersService.data.currentUser
  $scope.users = usersService.data.users
  usersService.loadUsers()
  return