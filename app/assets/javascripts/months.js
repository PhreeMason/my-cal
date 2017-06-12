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

class Month {
  constructor(attributes){
     this.name = attributes.name
     this.year = attributes.year
     this.id = attributes.id
     this.days = attributes.all_days
     this.prev_month = attributes.prev_month_last_days
     this.next_month = attributes.next_month_first_days
     this.tasks = attributes.tasks
  }
 render_month(){
   return 
 }

}



$(function () {
    var $month = $(".month-name") 
    var id = $month.data("id");
    var this_month   = $("#days-template").html();
    var other_month = $("#other-days-template").html();
    var thisMonthTemplate = Handlebars.compile(this_month);
    var otherMonthTemplate = Handlebars.compile(other_month);
    $.get("/months/" + id + ".json", function(data) {
      console.log(data);
    });
  });

