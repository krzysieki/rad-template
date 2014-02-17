@DashboardCtrl = ($scope, usersService) ->
  $scope.title = "Digital Ad Control Panel"
  $scope.currentUser = usersService.data.currentUser