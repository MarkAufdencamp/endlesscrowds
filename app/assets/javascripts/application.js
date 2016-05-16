// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require ./lib/jquery-1.7.1.min.js
//= require jquery_ujs
//= require foundation
//= require ./lib/jquery-ui-1.9.2.custom.min.js
//= require best_in_place
//= require ./lib/underscore-min.js
//= require ./lib/backbone-min.js
//= require ./lib/wysihtml5.simple.js
//= require ./lib/wysihtml5-0.3.0.js
//= require_tree ./lib
//= require ./app/catarse.js
//= require ./app/views/model.js
//= require ./app/views/paginated.js
//= require ./app/collections/paginated.js
//= require_tree ./app
//= require ./init.js

$(document).ready( function() {
    $("li.facebook a").on("click",function(e){e.preventDefault(),window.open("https://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(location.href),"share","width=640, height=320")});

    // header menu dropdown
    $( "#dropdown-explore" ).click(function() {
      console.log("sam i am");
      $( "#dropcontent-explore" ).toggle();
    });

    // login button dropdown
    $( "#dropdown-user" ).click(function() {
      $( "#dropcontent-user" ).toggle();
    });
});


$(function(){ $(document).foundation(); });
