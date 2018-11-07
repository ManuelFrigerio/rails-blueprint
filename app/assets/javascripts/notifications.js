var notification = function(color, msg, pos) {
  var notification = document.createElement("div");
  var direction = (pos == "bottom" ? "Up" : "Down");
  notification.classList = "notification animated fadeIn"+ direction +" "+color+" "+ pos;
  notification.innerHTML = msg;
  document.getElementsByTagName('body')[0].appendChild(notification);
  setTimeout(function() {
    notification.classList.remove("fadeInDown");
    notification.classList.add("fadeOutUp");
  }, 3500);
};

var showSuccess = function(msg, pos = "") {
  notification('is-success', msg, pos);
};

var showError = function(msg, pos = "") {
  notification('is-danger', msg, pos);
};

var showWarning = function(msg, pos = "") {
  notification('is-warning', msg, pos);
};

var showNotice = function(msg, pos = "") {
  notification('is-info', msg, pos);
};