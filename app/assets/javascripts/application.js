// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var notification = function(color, msg) {
  var notification = document.createElement("div");
  notification.classList = "notification animated fadeInDown "+color;
  notification.innerText = msg;
  document.getElementsByTagName('body')[0].appendChild(notification);
  setTimeout(function() {
    notification.classList.remove("fadeInDown");
    notification.classList.add("fadeOutUp");
  }, 3500);
};

var showError = function(msg) {
  notification('is-danger', msg);
};

var showNotice = function(msg) {
  notification('is-success', msg);
};