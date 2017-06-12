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
  
  renderAllDays(prev, current, next){
    this.renderLastMonthDays(prev)
    this.renderThisMonthDays(current)
    this.renderNextMonthDays(next)
  }
  
  renderLastMonthDays(template){
    var temp = template(this.prev_month)
    $('.days').append(temp)
  }
  
  renderThisMonthDays(template){
     var temp = template(this.days)
    $('.days').append(temp)
  }
  
  renderNextMonthDays(template){
    var temp = template(this.next_month)
    $('.days').append(temp)
  }
  
  renderTasks(template){
    this.tasks.forEach(function(e){
      if ($(`#task-${e.day}`).length) {
        
      } else {
        var add = template(e)
        $(`#day-month-${e.day}`).append(template(e));
      }
     });
  }
}



$(function () {
    var $month = $(".month-name") 
    var id = $month.data("id");
    var thisMonth   = $("#days-template").html();
    var otherMonth = $("#other-days-template").html();
    var tasks = $('#event-template').html();
    var current = Handlebars.compile(thisMonth);
    var other = Handlebars.compile(otherMonth);
    var tasksTemplate = Handlebars.compile(tasks)
    $.get("/months/" + id + ".json", function(data) {
      var month = new Month(data)
      month.renderAllDays(other, current, other)
      month.renderTasks(tasksTemplate)
    });
  });

