@DashboardCtrl = ($scope, currentUser) ->
  $scope.title = "Digital Ad Control Panel"
  $scope.currentUser = currentUser.data

  currentUser.loadUser()