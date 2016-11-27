// $(document).ready(function(){
//   $("a.modals").click(function() {
//     $(".bootstrap-wysihtml5-insert-image-modal").parent().hide();
//   });

//   set_positions = function(){
//     $('.sortable').each(function(i){
//       $(this).attr("data-pos",i+1);
//     });
//   }

//   set_positions();
//   sortable('.sortable', {
//     hoverClass: 'is-hovered'
//   });

//   // after the order changes
//   $('.sortable').sortable().bind('sortupdate', function(e, ui) {
//   // sortable('.sortable', 'sortupdate', function(e) {
//     updated_order = []
//     console.log("set the updated positions");
//     set_positions();

//     console.log("populate the updated_order array with the new task positions");
//     $('.sortable').each(function(i){
//       updated_order.push({
//         id: $(this).children(".panel.panel-default.is-hovered").data("id"),
//         position: i+1
//       });
//     });

//     console.log("send the updated order via ajax");
//     $.ajax({
//       type: "PUT",
//       dataType: "json",
//       url: "/locations/sort",
//       data: {
//         order: updated_order
//       }
//     });
//   });

// });
