// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
$(document).on('keyup','#commentarea',function() {
    if (event.keyCode == 13) {
      event.preventDefault();
      $('#button').click();
      }
});




$(document).on('keyup','#replyarea',function() {
    if (event.keyCode == 13) {
      event.preventDefault();
      $('#replybutton').click();
      }
});
