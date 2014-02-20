(function(){var e;e=angular.module("ControlPanel",["ui.bootstrap","ngRoute","ngAnimate","angularFileUpload"]),e.config(["$routeProvider",function(e){return e.when("/dashboard",{templateUrl:"../assets/mainDashboard.html",controller:"DashboardCtrl"}),e.when("/invoices",{templateUrl:"../assets/mainInvoices.html",controller:"InvoiceCtrl"}),e.when("/ads",{templateUrl:"../assets/mainAds.html",controller:"DashboardCtrl"}),e.when("/playlists",{templateUrl:"../assets/mainPlaylists.html",controller:"PlaylistsCtrl"}),e.when("/playlists/:playlistId",{templateUrl:"../assets/editPlaylist.html",controller:"PlaylistsCtrl"}),e.when("/devices",{templateUrl:"../assets/mainDevices.html",controller:"DevicesCtrl"}),e.when("/devices/:deviceserial",{templateUrl:"../assets/mainDevice.html",controller:"DevicesCtrl"}),e.when("/help",{templateUrl:"../assets/mainHelp.html",controller:"DashboardCtrl"}),e.when("/adminDashboard",{templateUrl:"../assets/adminDashboard.html"}),e.when("/adminUsers",{templateUrl:"../assets/adminUsers.html",controller:"usersCtrl"}),e.when("/adminDevices",{templateUrl:"../assets/adminDevices.html"}),e.when("/adminPlaylists",{templateUrl:"../assets/adminPlaylists.html"}),e.when("/adminInvoices",{templateUrl:"../assets/adminInvoices.html"}),e.otherwise({templateUrl:"../assets/mainDashboard.html",controller:"DashboardCtrl"})}]),e.config(["$httpProvider",function(e){return e.defaults.headers.common["X-CSRF-Token"]=$("meta[name=csrf-token]").attr("content")}])}).call(this),function(){angular.module("ControlPanel").factory("adsService",["$http",function(e){var t;return t={data:{ads:[{id:0,name:"Loading ..."}]},isLoaded:!1},t.loadAds=function(r){return t.isLoaded?r?r.resolve():void 0:e.get("./ads.json").success(function(e){return t.data.playlists=e,t.isLoaded=!0,console.log("Successfully loaded ads."),r?r.resolve():void 0}).error(function(){return console.error("Failed to load ads."),r?r.resolve():void 0})},t.deleteAd=function(t){return console.log("Ad with id "+t+" is going to get deleted"),e["delete"]("./ads/"+t+".json").success(function(){return console.log("Deleted success!")}).error(function(){return console.log("Delete failed")})},t.createAd=function(r){var s;return s={new_ad:{name:r.newAdName}},e.post("./ads.json",s).success(function(e){return console.log("Succesfully created ad."),t.data.ads.push(e)}).error(function(){return console.error("Failed to create new ad")}),!0},t}])}.call(this),function(){angular.module("ControlPanel").factory("currentUser",["$http",function(e){var t;return t={data:{user:[{email:"Not logged in."}]},isLoaded:!1},t.loadUser=function(){return t.isLoaded?void 0:e.get("./users.json").success(function(e){return t.data.user=e,t.isLoaded=!0}).error(function(){return console.error("Failed to load users.")})},t}])}.call(this),function(){angular.module("ControlPanel").factory("deviceService",["$http",function(e){var t;return t={data:{devices:[{id:0,serial:"Loading ..."}]},isLoaded:!1},t.loadDevices=function(r){return t.isLoaded?r?r.resolve():void 0:e.get("./devices.json").success(function(e){return t.data.devices=e,t.isLoaded=!0,console.log("Successfully loaded devices."),r?r.resolve():void 0}).error(function(){return console.error("Failed to load devices."),r?r.resolve():void 0})},t}])}.call(this),function(){angular.module("ControlPanel").factory("invoiceService",["$http",function(){var e;return e={invoices:[{id:0,file:"file.pdf",date:"01/06/2013",status:"info"},{id:1,file:"file.pdf",date:"01/06/2013",status:"error"},{id:2,file:"file.pdf",date:"20/03/2013",status:"payed"}]}}])}.call(this),function(){angular.module("ControlPanel").factory("playlistService",["$http",function(e){var t;return t={data:{playlists:[{id:0,name:"Loading ..."}]},isLoaded:!1},t.loadPlaylists=function(r){return t.isLoaded?r?r.resolve():void 0:e.get("./playlists.json").success(function(e){return t.data.playlists=e,t.isLoaded=!0,console.log("Successfully loaded playlists."),r?r.resolve():void 0}).error(function(){return console.error("Failed to load playlists."),r?r.resolve():void 0})},t.deletePlaylist=function(t){return console.log("Playlist with id "+t+" is going to get deleted"),e["delete"]("./playlists/"+t+".json").success(function(){return console.log("Deleted success!")}).error(function(){return console.log("Delete failed")})},t.createPlaylist=function(r){var s;return s={new_playlist:{name:r.newPlaylistName}},e.post("./playlists.json",s).success(function(e){return console.log("Succesfully created playlist."),t.data.playlists.push(e)}).error(function(){return console.error("Failed to create new playlist")}),!0},t}])}.call(this),function(){angular.module("ControlPanel").factory("usersService",["$http",function(e){var t;return t={data:{users:[{id:0,name:"Loading ..."}],currentUser:{id:0,email:"Not loaded"}},isLoaded:!1},t.loadCurrentUser=function(r){return e.get("./currentuser").success(function(e){return t.data.currentUser=e,r?r.resolve():void 0}).error(function(){return console.error("Failed to load user"),r?r.resolve():void 0})},t.loadUsers=function(r){return t.isLoaded?void 0:e.get("./users.json").success(function(e){return t.data.users=e,t.isLoaded=!0,console.log("Successfully loaded users."),r?r.resolve():void 0}).error(function(){return console.error("Failed to load users."),r?r.resolve():void 0})},t}])}.call(this),function(){this.DashboardCtrl=function(e,t,r,s){return e.title="Digital Ad Control Panel",e.currentUser=t.data.currentUser,e.bars=[],e.prepCurrentUser=function(){return e.currentUser=t.data.currentUser},this.deferred=r.defer(),this.deferred.promise.then(e.prepCurrentUser),t.loadCurrentUser(this.deferred),e.onFileSelect=function(t){var r,l,a,n;for(a=0;a<t.length;)l=t[a],r=!1,n={},n.name=l.name,n.value=0,e.bars.push(n),e.upload=s.upload({url:"fileuploads",file:l,fileFormDataName:"dbfile"}).progress(function(e){console.log(l.name+" returned "),n.value=parseInt(100*e.loaded/e.total)}).success(function(){}),a++}},this.DashboardCtrl.$inject=["$scope","usersService","$q","$upload","$filter"]}.call(this),function(){this.InvoiceCtrl=function(e,t){return e.title="Invoice part",e.invoices=t,e.error="error"}}.call(this),function(){this.ModalInstanceCtrl=function(e,t,r){e.edit=!1,e.formData={newPlaylistName:""},e.ok=function(){e.edit||t.createPlaylist(e.formData),r.dismiss("Created")},e.cancel=function(){r.dismiss("cancel")}}}.call(this),angular.module("adsCtrl",[]),function(){this.DevicesCtrl=function(e,t,r,s,l){return e.data={devices:r.data.devices,currentPlaylist:{name:"test"}},e.data.deviceId=t.deviceId,e.viewDevice=function(e){return l.url("/devices/"+e)},e.prepDevices=function(){var t;return t=_.findWhere(r.data.devices,{id:parseInt(e.data.deviceId)}),e.data.currentDevice=t,e.data.devices=r.data.devices},this.deferred=s.defer(),this.deferred.promise.then(e.prepDevices),r.loadDevices(this.deferred)}}.call(this),function(){this.PlaylistsCtrl=function(e,t,r,s,l,a){return e.data={playlists:r.data.playlists,currentPlaylist:{name:"test"}},e.data.playlistId=t.playlistId,e.open=function(){var t;return t=s.open({templateUrl:"../assets/newPlaylist.html",controller:ModalInstanceCtrl,resolve:{items:function(){return e.items}}})},e.editPlaylist=function(e){return a.url("/playlists/"+e)},e.destroyPlaylist=function(t){var s;return s=_.findWhere(r.data.playlists,{id:parseInt(t)}),r.deletePlaylist(parseInt(t)),r.data.playlists.splice(r.data.playlists.indexOf(s),1),e.data.playlists=r.data.playlists},e.prepPlaylists=function(){var t;return t=_.findWhere(r.data.playlists,{id:parseInt(e.data.playlistId)}),e.data.currentPlaylist=t,e.data.playlists=r.data.playlists},this.deferred=l.defer(),this.deferred.promise.then(e.prepPlaylists),r.loadPlaylists(this.deferred)}}.call(this),function(){this.usersCtrl=function(e,t,r){return e.currentUser=t.data.currentUser,e.users=t.data.users,t.loadUsers(),e.prepUsers=function(){return e.users=t.data.users},this.deferred=r.defer(),this.deferred.promise.then(e.prepUsers),t.loadUsers(this.deferred)}}.call(this);