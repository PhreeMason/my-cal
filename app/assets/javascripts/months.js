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
  
  displayName(){
    $('.month-name').html(`${this.name} ${this.year}`)
  }
  
  renderLastMonthDays(template){
    var temp = template(this.prev_month)
    $('.days').html(temp)
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
        $(`#day-month-${e.day}`).append('<a href="#" class="more-tasks">New</a>')
      } else {
        $(`#day-month-${e.day}`).append(template(e));
      }
     });
  }
}

var thisMonth;
var otherMonth;
var tasks;
var current;
var other;
var tasksTemplate;



$(function () {
    var $month = $(".month-name") 
    var id = $month.data("id");
    thisMonth   = $("#days-template").html();
    otherMonth = $("#other-days-template").html();
    tasks = $('#event-template').html();
    current = Handlebars.compile(thisMonth);
    other = Handlebars.compile(otherMonth);
    tasksTemplate = Handlebars.compile(tasks)
    $.get("/months/" + id + ".json", function(data) {
      var month = new Month(data)
      month.renderAllDays(other, current, other)
      month.renderTasks(tasksTemplate)
    });
  });

$(function() {
  $('.js-next').click(function(e){
    e.preventDefault()
    $.get(`${this.href}.json`, function(data) {
      var month = new Month(data)
      debugger
      month.renderAllDays(other, current, other)
      month.renderTasks(tasksTemplate)
    });
  })
})