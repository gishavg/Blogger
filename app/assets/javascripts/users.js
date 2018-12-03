$(document).on('click','.new',function() {
  jQuery('.newpost').toggle('show');
});

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

$(document).on('click','#lastday',function() {
  var x = $('#feedtype').val();
  user_id=this.getAttribute("user_id");
  type = this.getAttribute("type");
  url = "/users/"+this.getAttribute("user_id")+"/filterby";
  $.ajax({
    url: url,
    method: "GET",
    data: {post: x, type: type}
  })
});

$(document).on('click','#lastweek',function() {
  var x = $('#feedtype').val();
  user_id=this.getAttribute("user_id");
  type = this.getAttribute("type");
  url = "/users/"+this.getAttribute("user_id")+"/filterby";
  $.ajax({
    url: url,
    method: "GET",
    data: {post: x, type: type}
  })
});

$(document).on('click','#lastmonth',function() {
  var x = $('#feedtype').val();
  user_id=this.getAttribute("user_id");
  type = this.getAttribute("type");
  url = "/users/"+this.getAttribute("user_id")+"/filterby";
  $.ajax({
    url: url,
    method: "GET",
    data: {post: x, type: type}
  })
});

$(document).on('click','#lastyear',function() {
  var x = $('#feedtype').val();
  user_id=this.getAttribute("user_id");
  type = this.getAttribute("type");
  url = "/users/"+this.getAttribute("user_id")+"/filterby";
  $.ajax({
    url: url,
    method: "GET",
    data: {post: x, type: type}
  })
});

function searchKey() {
    var x = document.getElementById("search");
    search_key = x.value
    user_id = x.getAttribute("user_id");
    first = search_key.charAt(0)
    if (first == '@') {
      url = "/users/searchuser"
      $.ajax({
        url: url,
        method: "GET",
        data: {key: search_key,user_id: user_id}
      })
    }
    else {
      url = "/users/search"
      $.ajax({
        url: url,
        method: "GET",
        data: {key: search_key,user_id: user_id}
      })
      document.getElementById("user_id").style.display = "none";
    }
}

$(document).on('click','#sortbylike',function() {
  var x = $('#feedtype').val();
  user_id=this.getAttribute("user_id");
  url = "/users/"+this.getAttribute("user_id")+"/sortbylike";
  $.ajax({
    url: url,
    method: "GET",
    data: {post: x}
  })
});

function change_user(){
  var elem = document.getElementById("user_id");
  var selectedOptVal = elem.options[elem.selectedIndex].value;
  location.href = selectedOptVal;
}
