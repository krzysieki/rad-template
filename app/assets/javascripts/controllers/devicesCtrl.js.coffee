@DevicesCtrl = ($scope, $routeParams, deviceService, $q, $location) ->
  $scope.data =
    devices: deviceService.data.devices
    currentPlaylist:
      name: 'test'

  $scope.data.deviceId = $routeParams.deviceId

  $scope.viewDevice = (deviceId) ->
    $location.url('/devices/' + deviceId)

  $scope.prepDevices = ->
    device = _.findWhere(deviceService.data.devices, {id: parseInt($scope.data.deviceId)})
    $scope.data.currentDevice = device
    $scope.data.devices = deviceService.data.devices

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepDevices)

  deviceService.loadDevices(@deferred)