$(document).on('click','.like',function() {
    event.preventDefault();
    var color = 'blue';
    url = "/users/"+this.getAttribute("data-id")+"/likes";
    post_id=this.getAttribute("post-id");
    type = this.getAttribute("data-type");
    $.ajax({
      url: url,
      method: "POST",
      data: {post_id: post_id,type: type}
    })
});


$(document).on('click','.unlike',function() {
    event.preventDefault();
    var color = 'blue';
    url = "/users/"+this.getAttribute("data-id")+"/likes/"+this.getAttribute("post-id");
    post_id=this.getAttribute("post-id");
    type = this.getAttribute("data-type");
    $.ajax({
      url: url,
      method: "DELETE",
      data: {post_id: post_id,type: type}
    })
});


function searchKey() {
    var x = document.getElementById("search");
    search_key = x.value
    user_id = x.getAttribute("user_id");
    url = "/users/search"
    $.ajax({
      url: url,
      method: "GET",
      data: {key: search_key,user_id: user_id}
    })
}
