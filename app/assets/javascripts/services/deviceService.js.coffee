angular.module('ControlPanel').factory('deviceService', ['$http', ($http) ->
  deviceService =
    data:
      devices: [{"id":0,"serial":"Loading ..."}]
    isLoaded: false

  deviceService.loadDevices = (deferred) ->
    if !deviceService.isLoaded
      $http.get('./devices.json').success( (data) ->
        deviceService.data.devices = data
        deviceService.isLoaded = true
        console.log('Successfully loaded devices.')
        if deferred
          deferred.resolve()
      ).error( ->
          console.error('Failed to load devices.')
          if deferred
            deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()

  return deviceService
])