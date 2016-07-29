
function say_hello() {
  // window.localStorage.clear();
  var x = window.localStorage.getItem('aaa');
  x = x * 1 + 1;
  window.localStorage.setItem('aaa', x);
  alert(x);
}
