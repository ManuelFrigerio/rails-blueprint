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
  notification('success', msg, pos);
};

window.showError = function(msg, pos = "") {
  notification('error', msg, pos);
};

window.showWarning = function(msg, pos = "") {
  notification('warning', msg, pos);
};

window.showNotice = function(msg, pos = "") {
  notification('notice', msg, pos);
};