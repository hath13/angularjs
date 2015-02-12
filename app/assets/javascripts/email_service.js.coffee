app.factory "emailService",[
  "$http"
  "ngTableParams"
  ($http, ngTableParams) ->
    service = {}
    service.getReceivedEmail = ($scope, params, $defer) ->
      search_params =
        page: params.page()
        per_page: params.count()
        format: "json"
      $http(
        method: 'get'
        url: Routes.emails_path search_params
        ).success (response) ->
          params.total response.total_received_email
          if response.total_unread_email == null
            $scope.total_unread_email = 0
          else
            $scope.total_unread_email = response.total_unread_email
          $scope.received_emails = response.received_emails
          $scope.unread_emails = response.unread_emails
          $scope.modal.current_email = response.current_email

    service.getSentEmail = ($scope, params, $defer) ->
      search_params =
        page: params.page()
        per_page: params.count()
        format: "json"
      $http(
        method: 'get'
        url: Routes.emails_path search_params
        ).success (response) ->
          params.total response.total_sent_email
          $scope.sent_emails = response.sent_emails

    service.showEmail = ($scope, email, index) ->
      $scope.email = email
      updateUnread($scope, email, index)

    service.sendEmail = ($scope, email) ->
      params =
        email: email
        format: "json"
      console.log params
      $http(
        method: "post"
        url: Routes.emails_path params
      ).success (response) ->
        $scope.sent_emails.push(response.email)

    service.updateUnreadEmails = ($scope, email, index) ->
      updateUnread($scope, email, index)

    updateUnreadEmailsList = ($scope, email,index) ->
      $scope.total_unread_email -= 1 if $scope.total_unread_email > 0
      $scope.unread_email = email
      $scope.modal_email = $scope.modal.detail_email+index
      $scope.unread_emails.splice(index,1)
      $scope.received_emails.splice(index,1,email)

    updateUnread = ($scope, email, index) ->
      if email.is_read is false or email.is_read is undefined
        params =
          email:
            is_read: true
          format: "json"
        $http(
          method: "patch"
          url: Routes.email_path("#{email.id}", params)
          ).success (response) ->
            updateUnreadEmailsList($scope, response.email, index)

    service
]


