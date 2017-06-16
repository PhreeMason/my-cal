var tasksTemplate 
var tasks
var addToDiv

$(document).on('turbolinks:load', function() {
  if ($('body').is('.task-index-page')) {
    tasksTemplate = Handlebars.compile($('#tasks-index-template').html());
    var link = $('#alltasks').attr('href')
    $.get(link + ".json", function(data) {
      addToDiv = tasksTemplate(data);
      $('#anchor-tasks').html(addToDiv);
    });
  }
})