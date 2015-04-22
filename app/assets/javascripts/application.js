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
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var xmlhttp = new XMLHttpRequest();
var url = "http://services.wine.com/api/beta2/service.svc/JSON/catalog?apikey=b1af7f1d65f1e1ebdb2faf060ad8fadd";

xmlhttp.onreadystatechange = function() {
  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
    var myArr = JSON.parse(xmlhttp.responseText);
  }
}
xmlhttp.open("GET", url, true);
xmlhttp.send();


console.log(xmlhttp);


var displayBottle = function(data) {
  // debugger
  console.log(data);
}


var req = new XMLHttpRequest();
var link = "http://services.wine.com/api/beta2/service.svc/JSON/catalog?search=Mondavi&apikey=b1af7f1d65f1e1ebdb2faf060ad8fadd"

req.onreadystatechange = function() {
  console.log('state changed', req.readyState, req.status);
  if (req.readyState == 4 && req.status == 200) {

    console.log('received success response', req.responseText);
    var data = JSON.parse(req.responseText);

    displayBottle(data);
  }
}
req.open("GET", link, true);
req.send();

// var wine = req.response;
// console.log('wine is', wine);

