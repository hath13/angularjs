# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#new_post").validate
    rules:
      "post[title]":
        required: true
        minlength: 6
    messages:
      "post[title]":
        required: "Title can't be blank"
        minlength: "Title is too short( minimum is 6 characters)"

