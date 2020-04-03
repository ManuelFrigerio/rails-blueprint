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

window.showSuccess = function(msg, pos = "") {
  notification('is-success', msg, pos);
};

window.showError = function(msg, pos = "") {
  notification('is-danger', msg, pos);
};

window.showWarning = function(msg, pos = "") {
  notification('is-warning', msg, pos);
};

window.showNotice = function(msg, pos = "") {
  notification('is-info', msg, pos);
};