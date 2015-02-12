# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller "emailCtrl",[
  "$scope"
  "$http"
  "$location"
  "emailService"
  "ngTableParams"
  ($scope, $http, $location, emailService, ngTableParams) ->
    $scope.show =
      received_email: true
      sent_email: false
      detail_email: false
      send_btn: true
      from: true
      to: false
    $scope.modal =
      detail_email: "detail"
      new_email: "new"
      popup_email: "popup"
      current_email:""
    $scope.startPage = 1
    $scope.perPage = 5

    $scope.getReceivedEmails = ->
      $scope.tableReceivedEmail = new ngTableParams(
        page: $scope.startPage
        count: $scope.perPage
      ,
        total: 0
        getData: ($defer, params) ->
          console.log params.page()
          emailService.getReceivedEmail($scope, params, $defer)
        )

    $scope.getSentEmails = ->
      $scope.tableSentEmail = new ngTableParams(
        page: $scope.startPage
        count: $scope.perPage
      ,
        total: 0
        getData: ($defer, params) ->
          console.log params.page()
          emailService.getSentEmail($scope, params, $defer)
        )

    $scope.getReceivedEmails()
    $scope.getSentEmails()

    $scope.showEmail = (email, index, val) ->
      $scope.show.detail_email = val
      emailService.showEmail($scope, email, index)

    $scope.updateUnreadEmail = (email,index,val) ->
      $scope.show.send_btn = val
      emailService.updateUnreadEmails($scope,email,index)

    $scope.sendEmail = (obj) ->
      email = angular.copy(obj.data)
      emailService.sendEmail($scope, email)

    $scope.showTab = (received, sent, val) ->
       $scope.show.received_email= received
       $scope.show.sent_email= sent
       $scope.show.from = val
       $scope.show.to = !val
       $scope.show.detail_email = false
       console.log $scope.show.to
]

# emailApp.directive "detailEmail",
# () ->
#   restrict: "EA"
#   scope:{
#     emailInfo: "=info"
#   }
#   templateUrl: "assets/email_detail.html"

# emailApp.filter "checkRead", ->
#   (input) ->
#     (if input then "✓" else "✘")
