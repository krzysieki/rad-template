@userCtrl = ($scope, currentUser) ->
  $scope.currentUser = currentUser.data

  currentUser.loadUser()