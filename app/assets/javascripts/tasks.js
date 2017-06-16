$(function() {
  if ($('#task-index-page').length) {
    Handlebars.registerPartial('displayTask', $('#tasks-partial').html());
    var tasksTemplate = Handlebars.compile($('#tasks-index-template').html());
    var link = $('#alltasks').attr('href')
    $.get(link + ".json", function(data) {
        console.log(data);
    });
  }
})

$(document).on('turbolinks:load', function() {
  if ($('body').is('.task-index-page')) {
  Handlebars.registerPartial('displayTask', $('#tasks-partial').html());
    var tasksTemplate = Handlebars.compile($('#tasks-index-template').html());
    var link = $('#alltasks').attr('href')
    $.get(link + ".json", function(data) {
        console.log(data);
    });
  }
})