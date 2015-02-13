app.directive "detailEmail",
() ->
  restrict: "EA"
  scope:{
    emailInfo: "=info"
    tab_received: "=received"
  }
  templateUrl: "assets/email_detail.html"

app.directive "popupEmail",
() ->
  restrict: "EA"
  scope: {
    submit_email: "&send"
    email: "=detail"
    send_btn: "=btn"
    id_modal: "=id"
    user_email: "=user"
  }
  templateUrl: "assets/popup_email_form.html"
  link: (scope, element, attrs) ->
    scope.myClick = () ->
      obj = {
        data: {
          from: scope.user_email
          to: scope.email.email_to
          title: scope.email.email_title
          body: scope.email.email_body
        }
      }
      scope.submit_email()(obj)

app.directive "validateEmail",
() ->
  # EMAIL_REGEXP = /^([a-zA-Z0-9_.-\+])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9,]{2,4})+$/
  {
    restrict: "A"
    require: '^popupEmail'
    link: (scope, element, attrs) ->
      email_arr = scope.email.email_to.split(",")
      console.log email_arr
      i = 0
      while i < email_arr.length
        if !EMAIL_REGEXP.test(email_arr[i])
          scope.send_btn = false
          return false
        i++
  }


