// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('click','.like',function() {
    event.preventDefault();
    console.log(this.dataset.id);
    console.log(this.getAttribute("data-id"));
    url = "/users/"+this.getAttribute("data-id")+"/likes"
    post_id=this.getAttribute("post-id")
    alert(url);
    $.ajax({
      url: url,
      method: "POST",
      data: {pos: post_id}
    }).done(function() {
      alert("hai suceesfully like");
      $( this ).addClass( "done" );
    });
});
