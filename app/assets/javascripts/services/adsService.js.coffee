angular.module('ControlPanel').factory('adsService', ['$http', ($http) ->
  adsService =
    data:
      ads: [{"id":0,"name":"Loading ..."}]
    isLoaded: false

  # Load playlists from server function
  adsService.loadAds = (deferred) ->
    if !adsService.isLoaded
      $http.get('./ads.json').success( (data) ->
        adsService.data.playlists = data
        adsService.isLoaded = true
        console.log('Successfully loaded ads.')
        if deferred
          deferred.resolve()
      ).error( ->
          console.error('Failed to load ads.')
          if deferred
            deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()

  # Delete playlist function
  adsService.deleteAd = (adId) ->
    console.log('Ad with id ' + adId + ' is going to get deleted')
    $http.delete('./ads/' + adId + '.json').success( ->
      console.log('Deleted success!')
    ).error( ->
      console.log('Delete failed')
    )

  # Add new playlist function
  adsService.createAd = (newAd) ->
    # data validation
    # if newPlaylist.newPlaylistName == ''
    #   alert('Name can't be blank')
    #   return false

    # create data object to post
    data =
      new_ad:
        name: newAd.newAdName

    # Do POST request
    $http.post('./ads.json', data).success( (data) ->
      console.log('Succesfully created ad.')
      adsService.data.ads.push(data)
    ).error( ->
      console.error('Failed to create new ad')
    )
    return true
  return adsService


])