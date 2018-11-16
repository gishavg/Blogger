// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// $(.allfeed).on("click", function() {
//    $("#post_public_section").show();
// });

  // $('.allfeed').click(function(event){
  //   event.preventDefault();
  //   // $('div#post_public_section').toggle();
  //   $("#post_public_section").show();
  // });

function onClicked (event) {
  event.preventDefault();
  $('div#post_public_section').toggle();
  $('#doticon').toggle();
}
