// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/sortable
//= require jquery-ui/effect-highlight
//= require bootstrap-sprockets
//= require html.sortable
//= require summernote
//= require_tree .

$(document).ready(function(){
  // $('.summernote').summernote('code');
  $('.summernote').summernote({
    height: 200,                 // set editor height
    minHeight: null,             // set minimum height of editor
    maxHeight: null,             // set maximum height of editor
    focus: true,
    toolbar: [
      // [groupName, [list of button]]
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['font', ['strikethrough', 'superscript', 'subscript']],
      ['fontsize', ['fontsize']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['height', ['height']],
      ['misc', ['undo', 'redo', 'help', 'fullscreen']]
    ]
  });
});

(function () {
  setTimeout(function() {
    return $("#flash").fadeOut("slow");
  }, 50000);

  setTimeout(function() {
    return $(".alert").fadeOut("slow");
  }, 50000);

  setTimeout(function() {
    return $(".alert-quick").fadeOut("slow");
  }, 50000);

  setTimeout(function() {
    return $(".alert-dismissable").fadeOut("slow");
  }, 5000);

}());
