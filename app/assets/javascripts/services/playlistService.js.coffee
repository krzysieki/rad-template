angular.module('ControlPanel').factory('playlistService', ['$http', ($http) ->
  playlistService =
    data:
      playlists: [{"id":0,"name":"Loading ..."}]
    isLoaded: false

  playlistService.loadPlaylists = (deferred) ->
    if !playlistService.isLoaded
      $http.get('./playlists.json').success( (data) ->
        playlistService.data.playlists = data
        playlistService.isLoaded = true
        console.log('Successfully loaded playlists.')
        if deferred
          deferred.resolve()
      ).error( ->
          console.error('Failed to load playlists.')
          if deferred
            deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()

  # Delete playlist function
  playlistService.deletePlaylist = (playlistId) ->
    console.log('Playlist with id ' + playlistId + ' is going to get deleted')
    $http.delete('./playlists/' + playlistId + '.json').success( ->
      console.log('Deleted success!')
    ).error( ->
      console.log('Delete failed')
    )

  # Add new playlist function
  playlistService.createPlaylist = (newPlaylist) ->
    # data validation
    # if newPlaylist.newPlaylistName == ''
    #   alert('Name can't be blank')
    #   return false

    # create data object to post
    data =
      new_playlist:
        name: newPlaylist.newPlaylistName

    # Do POST request
    $http.post('./playlists.json', data).success( (data) ->
      console.log('Succesfully created playlist.')
      playlistService.data.playlists.push(data)
    ).error( ->
      console.error('Failed to create new playlist')
    )
    return true
  return playlistService
])