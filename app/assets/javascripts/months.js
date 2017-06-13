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
    this.displayNameFixLinks()
  }
  
  displayNameFixLinks(){
    $('.month-name').html(`${this.name} ${this.year}`)
    $('.month-name').attr('data-id', `${this.id}`)
    $('#prev').attr('href', `/months/${this.id}/prev`)
    $('#next').attr('href', `/months/${this.id}/next`)
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
        $(`#day-month-${e.day}`).append('<a href="#" class="more-tasks">More...</a>')
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
    thisMonth   = $("#days-template").html();
    otherMonth = $("#other-days-template").html();
    tasks = $('#event-template').html();
    current = Handlebars.compile(thisMonth);
    other = Handlebars.compile(otherMonth);
    tasksTemplate = Handlebars.compile(tasks)
    getAndShowMonth()
  });

$(function() {
  $('.js-next').click(function(e){
    e.preventDefault()
    $.get(`${this.href}.json`, function(data) {
      showMonth(data)
    });
  })
})

function showMonth(data) {
  var month = new Month(data)
      month.renderAllDays(other, current, other)
      month.renderTasks(tasksTemplate)
}

function getAndShowMonth() {
  var $month = $(".month-name") 
  var id = $month.data("id");
  $.get("/months/" + id + ".json", function(data) {
      showMonth(data)
  });
}