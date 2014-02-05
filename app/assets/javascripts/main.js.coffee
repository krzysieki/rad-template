# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require_self
#= require_tree ./services
#= require_tree ./filters
#= require_tree ./controllers
#= require_tree ./directives

ControlPanel = angular.module('ControlPanel', ['ui.bootstrap', 'ngRoute'])

ControlPanel.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/dashboard', {templateUrl: '../templates/mainDashboard.html', controller: 'DashboardCtrl' } )
  $routeProvider.when('/ads', {templateUrl: '../templates/mainAds.html', controller: 'AdsCtrl' } )
  $routeProvider.when('/playlists', {templateUrl: '../templates/mainPlaylists.html', controller: 'PlaylistsCtrl' } )
  $routeProvider.when('/devices', {templateUrl: '../templates/mainDevices.html', controller: 'DevicesCtrl' } )
  $routeProvider.when('/help', {templateUrl: '../templates/mainHelp.html', controller: 'HelpCtrl' } )

  $routeProvider.otherwise({ templateUrl: '../assets/mainDashboard.html', controller: 'DashboardCtrl'})

])