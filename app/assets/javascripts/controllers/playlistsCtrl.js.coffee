@PlaylistsCtrl = ($scope, $routeParams, playlistService, $modal, $q) ->
  $scope.data =
    playlists: playlistService.data
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
    modalInstance = $modal.open(
      templateUrl: "../assets/newPlaylist.html"
      controller: ModalInstanceCtrl
      resolve:
        data: ->
          playlistId
    )

  $scope.destroyPlaylist = (playlistId) ->
    playlistService.deletePlaylist(playlistId)
    playlistService.data.playlists = null
    playlistService.isLoaded = false
    playlistService.loadPlaylists()

  $scope.prepPlaylists = ->
    playlist = _.findWhere(playlistService.data.playlists, {id: parseInt($scope.data.playlistId)})
    $scope.data.currentPlaylist = playlist
    console.log('promise completed')
    console.log(playlistService.data.playlists)

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepPlaylists)

  playlistService.loadPlaylists(@deferred)