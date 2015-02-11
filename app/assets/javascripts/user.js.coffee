$(document).ready ->
  $("#new_user").validate
    rules:
      "user[name]":
        required: true
        minlength: 6
      "user[login]":
        required: true
      "user[email]":
        required: true
        email: true
      "user[password]":
        required: true
        minlength: 8
      "user[password_confirmation]":
        required: true
        equalTo: "#user_password"
    messages:
      "user[name]":
        required: "Name can't be blank"
        minlength: "Name is too short(minimum is 6 characters)"
      "user[name]":
        required: "Please input name or email"
      "user[email]":
        required: "Email can't be blank"
        email:"Email is invalid"
      "user[password]":
        required: "Password can't be blank"
        minlength: "Password is too short(minimum is 8 characters)"
      "user[password_confirmation]":
        required:"Password confirmation can't blank"
        equalTo: "Password confirmation doesn't match Password"








