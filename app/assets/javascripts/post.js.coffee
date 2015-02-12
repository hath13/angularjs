# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
showPostsApp = angular.module("showPostsApp", ["ngRoute"])

showPostsApp.config [
  "$routeProvider"
  ($routeProvider) ->
    $routeProvider
    .when("/",
      templateUrl: "assets/post_list.html"
      controller: "ShowPostsCtr"
    )

    .otherwise redirectTo: "/"
]

showPostsApp.controller "ShowPostsCtr", [
  "$scope"
  "$http"
  ($scope, $http) ->
    $http.get("/posts.json").success (data) ->
      $scope.posts = data
    $scope.show = false
    $scope.post_form = (post) ->
      $scope.post = post
      $scope.show = true
    $scope.save_post = (post) ->
      $http.patch("/posts/#{post.id}.json",post,headers:{"X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')}).success ->
        $scope.show = false
        redirectTo:"/"

]

