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
 renderMonth(){
   return 
 }
 
 renderTasks(template){
   this.tasks.forEach(function(e){
      var add = template(e)
      $(`#this-month-${e.day}`).append(add);
    });
 }
}



$(function () {
    var $month = $(".month-name") 
    var id = $month.data("id");
    var this_month   = $("#days-template").html();
    var other_month = $("#other-days-template").html();
    var tasks = $('#event-template').html();
    var thisMonthTemplate = Handlebars.compile(this_month);
    var otherMonthTemplate = Handlebars.compile(other_month);
    var tasksTemplate = Handlebars.compile(tasks)
    $.get("/months/" + id + ".json", function(data) {
     var month = new Month(data)
     month.renderTasks(tasksTemplate)
    });
  });

