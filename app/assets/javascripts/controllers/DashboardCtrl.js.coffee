@DashboardCtrl = ($scope, usersService, $q, $upload) ->
  $scope.title = "Digital Ad Control Panel"
  $scope.currentUser = usersService.data.currentUser

  $scope.prepCurrentUser = ->
    $scope.currentUser = usersService.data.currentUser

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepCurrentUser)

  usersService.loadCurrentUser(@deferred)

  $scope.onFileSelect = ($files) ->

    #$files: an array of files selected, each file has name, size, and type.
    i = 0

    while i < $files.length
      file = $files[i]
      #upload.php script, node.js route, or servlet url
      # method: POST or PUT,
      # headers: {'headerKey': 'headerValue'},
      # withCredentials: true,

      # file: $files, //upload multiple files, this feature only works in HTML5 FromData browsers
      # set file formData name for 'Content-Desposition' header. Default: 'file'

      #fileFormDataName: myFile, //OR for HTML5 multiple upload only a list: ['name1', 'name2', ...]
      # customize how data is added to formData. See #40#issuecomment-28612000 for example

      #formDataAppender: function(formData, key, val){} //#40#issuecomment-28612000
      $scope.upload = $upload.upload(
        url: "ads/upload"
        data:
          myObj: $scope.myModelObj

        file: file
      ).progress((evt) ->
        console.log "percent: " + parseInt(100.0 * evt.loaded / evt.total)
        return
      ).success((data, status, headers, config) ->

        # file is uploaded successfully
        console.log data
        return
      )
      i++
    return

  #.error(...)
  #.then(success, error, progress);