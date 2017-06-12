// $(function(){
//     $('.new-task').on('click', function(e){
//       e.preventDefault();
//       alert("we r hack3rz");
//     });    
// })

// $(function () {
//   $('form').submit(function(event) {
//     //prevent form from submitting the default way
//     event.preventDefault();
//     var values = $(this).serialize();
//     var posting = $.post('/posts', values);
//     posting.done(function(data) {
//       var post = data;
//       $("#postTitle").text(post["title"]);
//       $("#postBody").text(post["description"]);
//     });
//   });
// });

$(function () {
    var $month = $(".month-name") 
    var id = $month.data("id");
    $.get("/months/" + id + ".json", function(data) {
      console.log(data);
    });
  });

