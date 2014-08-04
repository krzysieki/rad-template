# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require_self
#= require_tree ./services
#= require_tree ./controllers


ControlPanel = angular.module('ControlPanel', ['ui.bootstrap', 'ngRoute', 'ngAnimate', 'angularFileUpload'])

ControlPanel.config(['$routeProvider', ($routeProvider) ->
  # MAIN pages
  $routeProvider.when('/dashboard', {templateUrl: '../assets/templates/mainDashboard.html', controller: 'DashboardCtrl' } )
  $routeProvider.when('/invoices', {templateUrl: '../assets/templates/mainInvoices.html', controller: 'InvoiceCtrl' } )
  $routeProvider.when('/ads', {templateUrl: '../assets/templates/mainAds.html', controller: 'DashboardCtrl' } )
  $routeProvider.when('/playlists', {templateUrl: '../assets/templates/mainPlaylists.html', controller: 'PlaylistsCtrl' } )
  $routeProvider.when('/playlists/:playlistId', {templateUrl: '../assets/templates/editPlaylist.html', controller: 'PlaylistsCtrl' } )
  $routeProvider.when('/devices', {templateUrl: '../assets/templates/mainDevices.html', controller: 'DevicesCtrl' } )
  $routeProvider.when('/devices/:deviceserial', { templateUrl: '../assets/templates/mainDevice.html', controller: 'DevicesCtrl' } )
  $routeProvider.when('/help', {templateUrl: '../assets/templates/mainHelp.html', controller: 'DashboardCtrl' } )

  # ADMIN part
  $routeProvider.when('/adminDashboard', {templateUrl: '../assets/templates/adminDashboard.html' } )
  $routeProvider.when('/adminUsers', {templateUrl: '../assets/templates/adminUsers.html', controller: 'usersCtrl' } )
  $routeProvider.when('/adminDevices', {templateUrl: '../assets/templates/adminDevices.html' } )
  $routeProvider.when('/adminPlaylists', {templateUrl: '../assets/templates/adminPlaylists.html' } )
  $routeProvider.when('/adminInvoices', {templateUrl: '../assets/templates/adminInvoices.html' } )

  # DEFAULT page
  $routeProvider.otherwise({ templateUrl: '../assets/templates/mainDashboard.html', controller: 'DashboardCtrl'} )

])

ControlPanel.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
