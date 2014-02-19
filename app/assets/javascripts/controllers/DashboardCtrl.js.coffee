@DashboardCtrl = ($scope, usersService, $q, $upload, $filter) ->
  $scope.title = "Digital Ad Control Panel"
  $scope.currentUser = usersService.data.currentUser
  $scope.bars = []

  $scope.prepCurrentUser = ->
    $scope.currentUser = usersService.data.currentUser

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepCurrentUser)

  usersService.loadCurrentUser(@deferred)

  $scope.onFileSelect = ($files) ->
    i = 0

    while i < $files.length
      file = $files[i]
      busy = false
      while busy
      myBar = {}
      myBar.name=file.name
      myBar.value = 0
      $scope.bars.push(myBar)
      $scope.upload = $upload.upload(
        # headers: {'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'},
        # withCredentials: true,
        url: "fileuploads",
        file: file,
        fileFormDataName: 'dbfile'
        busy=true
      ).progress((evt) ->
        # myBar2 = $filter('filter')($scope.bars, {name:file.name}, true)
        console.log file.name + " returned "
        myBar.value = parseInt(100.0 * evt.loaded / evt.total)
        # myBar.value = parseInt(100.0 * evt.loaded / evt.total)
        return
      ).success((data, status, headers, config) ->
        return
      )
      i++
    return