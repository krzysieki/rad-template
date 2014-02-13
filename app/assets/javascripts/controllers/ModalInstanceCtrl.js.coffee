@ModalInstanceCtrl = ($scope, playlistsServ, $modalInstance) ->
  $scope.formData =
    newPlaylistName: ''

  $scope.ok = ->
    playlistsServ.createPlaylist($scope.formData)
    $modalInstance.dismiss "Created"
    return

  $scope.cancel = ->
    $modalInstance.dismiss "cancel"
    return

  return