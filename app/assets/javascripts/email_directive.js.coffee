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
  link: (scope) ->
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
