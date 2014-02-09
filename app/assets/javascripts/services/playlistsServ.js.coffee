angular.module('ControlPanel').factory('playlistsServ', ['$http', ($http) ->

  playlists =
      playlists: [{"id":0,"name":"PlaylistName","duration":"23:21","devices":[{"id":0,"serial":"da002541"}],"img":"http://placehold.it/150x150"},{"id":0,"name":"MyWallList","duration":"23:21","devices":[{"id":0,"serial":"da002541"},{"id":0,"serial":"da002541"},{"id":0,"serial":"da002459"},{"id":0,"serial":"da012654"}],"img":"http://placehold.it/150x150"},{"id":0,"name":"SomethingNamy","duration":"23:21","devices":[{"id":0,"serial":"da002987"},{"id":0,"serial":"da002541"},{"id":0,"serial":"da002320"}],"img":"http://placehold.it/150x150"},{"id":0,"name":"Blahblie","duration":"23:21","devices":[{"id":0,"serial":"da002999"},{"id":0,"serial":"da045129"}],"img":"http://placehold.it/150x150"}]
  return playlists
])

