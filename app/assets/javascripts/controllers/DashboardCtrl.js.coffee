@DashboardCtrl = ($scope, usersService, $q) ->
  $scope.title = "Digital Ad Control Panel"
  $scope.currentUser = usersService.data.currentUser

  $scope.prepCurrentUser = ->
    $scope.currentUser = usersService.data.currentUser

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepCurrentUser)

  usersService.loadCurrentUser(@deferred)