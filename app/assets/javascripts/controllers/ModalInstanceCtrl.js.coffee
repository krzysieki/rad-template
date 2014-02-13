@ModalInstanceCtrl = ($scope, playlistsServ, $modalInstance) ->
  $scope.edit = false
  $scope.formData =
    newPlaylistName: ''

  $scope.ok = ->
    playlistsServ.createPlaylist($scope.formData) if !$scope.edit
    $modalInstance.dismiss "Created"
    return

  $scope.cancel = ->
    $modalInstance.dismiss "cancel"
    return

  return