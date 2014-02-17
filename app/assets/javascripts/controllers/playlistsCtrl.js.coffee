@PlaylistsCtrl = ($scope, $routeParams, playlistService, $modal, $q, $location) ->
  $scope.data =
    playlists: playlistService.data.playlists
    currentPlaylist:
      name: 'test'

  $scope.data.playlistId = $routeParams.playlistId

  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: "../assets/newPlaylist.html"
      controller: ModalInstanceCtrl
      resolve:
        items: ->
          $scope.items
    )

  $scope.editPlaylist = (playlistId) ->
    $location.url('/playlists/' + playlistId)

  $scope.destroyPlaylist = (playlistId) ->
    playlist = _.findWhere(playlistService.data.playlists, {id: parseInt(playlistId)})
    playlistService.deletePlaylist(parseInt(playlistId))
    playlistService.data.playlists.splice(playlistService.data.playlists.indexOf(playlist),1)
    $scope.data.playlists = playlistService.data.playlists


  $scope.prepPlaylists = ->
    playlist = _.findWhere(playlistService.data.playlists, {id: parseInt($scope.data.playlistId)})
    $scope.data.currentPlaylist = playlist
    $scope.data.playlists = playlistService.data.playlists

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepPlaylists)

  playlistService.loadPlaylists(@deferred)