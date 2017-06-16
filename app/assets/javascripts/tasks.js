var tasksTemplate 
var addToDiv
var gg
$(document).on('turbolinks:load', function() {
  if ($('body').is('.task-index-page')) {
    tasksTemplate = Handlebars.compile($('#tasks-index-template').html());
    link = $('#alltasks').attr('href')
    getAndDisplayTasks(link)
   
   $('.get-tasks').click(function(e){
      e.preventDefault()
      getAndDisplayTasks( this.href)
    })
  }    
})

function getAndDisplayTasks(link) {
  $.get(link + ".json", function(data) {
    addToDiv = tasksTemplate(data);
    $('#anchor-tasks').html(addToDiv);
  });
}