// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.remotipart
//= require jquery_validate
//= require bootstrap
//= require angular
//= require angular-route
//= require js-routes
//= require ng-table
//= require demoApp
//= require_tree ./controllers
//= require_tree ./services
//= require_tree ./directives
//= require_tree ./filters
//= require_tree .

$(document).on('ready page:load', function() {
  angular.bootstrap(document.body, ['emailApp']);
  $("#menu li").on("click", function() {
    $(this).addClass("active");
    $(this).siblings().removeClass("active");
  });

  var availableEmails = [
      "hath14@hath.hath",
      "hath13@hath.hath",
      "hath7@hath.hath",
      "hath6@hath.hath",
      "hath5@hath.hath",
      "hath4@hath.hath",
      "hath3@hath.hath",
      "hath2@hath.hath",
      "hath1@hath.hath",
    ];
    $("#popup_to_email").autocomplete({
      source: availableEmails
    });
});


