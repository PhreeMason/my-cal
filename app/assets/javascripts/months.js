class Month {
  constructor(attributes){
     this.name = attributes.name
     this.year = attributes.year
     this.id = attributes.id
     this.days = attributes.all_days
     this.prev_month = attributes.prev_month_last_days
     this.next_month = attributes.next_month_first_days
     this.tasks = attributes.tasks
     this.order = attributes.order
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

  displayInputTime(day){
    var order = this.order < 10 ? '0' + this.order : this.order
    if (day) {
      day = day < 10 ? '0' + day : day
      return(`${this.year}-${order}-${day}T12:00`)
    } else {
      return(`${this.year}-${order}-12T12:00`)
    }
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
    var id = this.id
    this.tasks.forEach(function(e){
      if ($(`#task-${e.day}`).length) {
        $(`#day-month-${e.day}`).append(`<a href="/months/${id}/tasks" class="more-tasks">More...</a>`)
      } else {
        $(`#day-month-${e.day}`).append(template(e));
      }
     });
  }
}
var monthForNow
var thisMonth;
var otherMonth;
var tasks;
var current;
var other;
var tasksTemplate;


$(document).on('turbolinks:load', function() {
  if ($('body').is('.month-page')) {
      thisMonth   = $("#days-template").html();
      otherMonth = $("#other-days-template").html();
      tasks = $('#event-template').html();
      current = Handlebars.compile(thisMonth);
      other = Handlebars.compile(otherMonth);
      tasksTemplate = Handlebars.compile(tasks)
      getAndShowMonth()

     $('.js-next').click(function(e){
        e.preventDefault();
        $.get(`${this.href}.json`, function(data) {
          showMonth(data)
       });
     })
     $('#new-task-link').click(function(e){
        e.preventDefault();
        renderForm(e);
     })
     // $('.date').click(function(e){
     //    // e.preventDefault();
     //    console.log(this)
     //    console.log(e)
     // })
  }
})

function showMonth(data) {
      monthForNow = new Month(data)
      monthForNow.renderAllDays(other, current, other)
      monthForNow.renderTasks(tasksTemplate)
}

function getAndShowMonth() {
  var $month = $(".month-name")
  var id = $month.data("id");
  $.get("/months/" + id + ".json", function(data) {
      showMonth(data)
  });
}

function renderForm(e) {
      var template = $("#form-template").html();
      var formTemplate = Handlebars.compile(template)
      $('#page-form').html(formTemplate(monthForNow.displayInputTime()))

      id = $(".month-name").data("id")
      $('#close-form').attr('href', `/months/${id}`)

      $(function () {
        $('form').submit(function(event) {
          event.preventDefault();
          var values = $(this).serialize();
          var posting = $.post('/months/30/tasks.json', values);

          posting.done(function(data) {
            showMonth(data)
            $('#page-form').empty()
          });

          posting.fail(function(data) {
            var error = ''
            errors = data
            if (data.responseJSON.content) {
              error += "Content can't be blank. "
            }
            if (data.responseJSON.start_time) {
              error += 'Invalid Time. '
            }
            alert( error );
            $('#page-form').html(formTemplate)
          });
      });
    });
  }

