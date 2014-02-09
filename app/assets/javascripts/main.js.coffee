# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require_self
#= require_tree ./services
#= require_tree ./filters
#= require_tree ./controllers
#= require_tree ./directives

ControlPanel = angular.module('ControlPanel', ['ui.bootstrap', 'ngRoute', 'ngAnimate'])

ControlPanel.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/dashboard', {templateUrl: '../assets/mainDashboard.html', controller: 'DashboardCtrl' } )
  $routeProvider.when('/ads', {templateUrl: '../assets/mainAds.html', controller: 'DashboardCtrl' } )
  $routeProvider.when('/playlists', {templateUrl: '../assets/mainPlaylists.html', controller: 'PlaylistsCtrl' } )
  $routeProvider.when('/devices', {templateUrl: '../assets/mainDevices.html', controller: 'DevicesCtrl' } )
  $routeProvider.when('/devices/:deviceserial', { templateUrl: '../assets/mainDevice.html', controller: 'DeviceCtrl' } )
  $routeProvider.when('/help', {templateUrl: '../assets/mainHelp.html', controller: 'DashboardCtrl' } )

  $routeProvider.otherwise({ templateUrl: '../assets/mainDashboard.html', controller: 'DashboardCtrl'})

])