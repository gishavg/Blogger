// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
$(document).on('keyup','#commentarea',function() {
    if (event.keyCode == 13 && $.trim($('#commentarea').val()).length > 0) {
      event.preventDefault();
      $('#button').click();
      }
});




$(document).on('keyup','#replyarea',function() {
    if (event.keyCode == 13 && $.trim($('#replyarea').val()).length > 0) {
      event.preventDefault();
      $('#replybutton').click();
      }
});
