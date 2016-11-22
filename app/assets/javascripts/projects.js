$(document).ready( function(){
  console.log("Removing the image button");

  $("a.modals").click(function() {
    $(".bootstrap-wysihtml5-insert-image-modal").parent().hide();
  });
})
