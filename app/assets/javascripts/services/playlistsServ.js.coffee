angular.module('ControlPanel').factory('playlistsServ', ['$http', ($http) ->
  playlistsServ =
    data:
      playlists: [{"id":0,"name":"Loading ..."}]
      # playlists: [{"id":0,"name":"PlaylistName","duration":"23:21","devices":[{"id":0,"serial":"da002541"}],"img":"http://placehold.it/150x150"},{"id":0,"name":"MyWallList","duration":"23:21","devices":[{"id":0,"serial":"da002541"},{"id":0,"serial":"da002541"},{"id":0,"serial":"da002459"},{"id":0,"serial":"da012654"}],"img":"http://placehold.it/150x150"},{"id":0,"name":"SomethingNamy","duration":"23:21","devices":[{"id":0,"serial":"da002987"},{"id":0,"serial":"da002541"},{"id":0,"serial":"da002320"}],"img":"http://placehold.it/150x150"},{"id":0,"name":"Blahblie","duration":"23:21","devices":[{"id":0,"serial":"da002999"},{"id":0,"serial":"da045129"}],"img":"http://placehold.it/150x150"}]
    isLoaded: false

  # Load playlists from server function
  playlistsServ.loadPlaylists = (deferred) ->
    if !playlistsServ.isLoaded
      $http.get('./playlists.json').success( (data) ->
        playlistsServ.data.playlists = data
        playlistsServ.isLoaded = true
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
  playlistsServ.deletePlaylist = (playlistId) ->
    console.log('Playlist with id ' + playlistId + ' is going to get deleted')
    $http.delete('./playlists/' + playlistId + '.json').success( ->
      console.log('Deleted success!')
    ).error( ->
      console.log('Delete failed')
    )

  # Add new playlist function
  playlistsServ.createPlaylist = (newPlaylist) ->
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
      playlistsServ.data.playlists.push(data)
    ).error( ->
      console.error('Failed to create new playlist')
    )
    return true
  return playlistsServ


])