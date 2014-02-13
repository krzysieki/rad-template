@PlaylistsCtrl = ($scope, playlistsServ, $modal) ->
  playlistsServ.loadPlaylists()
  $scope.playlists = playlistsServ.data

  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: "../assets/newPlaylist.html"
      controller: ModalInstanceCtrl
      resolve:
        items: ->
          $scope.items
    )

  $scope.editPlaylist = (playlistId) ->
    modalInstance = $modal.open(
      templateUrl: "../assets/newPlaylist.html"
      controller: ModalInstanceCtrl
      resolve:
        data: ->
          playlistId
    )

  $scope.destroyPlaylist = (playlistId) ->
    playlistsServ.deletePlaylist(playlistId)
    playlistsServ.data.playlists = null
    playlistsServ.isLoaded = false
    playlistsServ.loadPlaylists()

  return