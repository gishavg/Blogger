// $( document ).on('turbolinks:load', function() {
//     let x = $('.pagination li a')
//     x.each(function( index ) {
//       console.log("asdas")
//       x[index].setAttribute("data-remote",true)
//       //x[index].setAttribute("data-method","get")
//       let url = x[index].getAttribute("href")
//       page=""
//       if (url.includes('?')){
//         page = url.split("?")[1]
//       }
//       url = "/users/27/allfeed?" + page
//       console.log(url)
//       x[index].setAttribute("href",url)
//
//     });
// });
// 
// $( document ).on('turbolinks:load', function() {
//
//     $('.show').load(function(){
//       let x = $('.pagination li a')
//       x.each(function( index ) {
//         console.log("asdas")
//           x[index].setAttribute("data-remote",true)
//           //x[index].setAttribute("data-method","get")
//           let url = x[index].getAttribute("href")
//           page=""
//           if (url.includes('?')){
//             page = url.split("?")[1]
//           }
//         // base_url = url.split("?")[0]
//         // url = base_url + page
//         console.log(url)
//         x[index].setAttribute("href",url)
//         });
//     });
// });

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
  alert(x)
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
  alert(x)
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
  alert(x)
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
  alert(x)
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
      document.getElementById("user_id").style.display = "none";
      url = "/users/search"
      $.ajax({
        url: url,
        method: "GET",
        data: {key: search_key,user_id: user_id}
      })
    }
}

$(document).on('click','#sortbylike',function() {
  var x = $('#feedtype').val();
  alert(x)
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
