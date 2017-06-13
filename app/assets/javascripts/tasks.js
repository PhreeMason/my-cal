var errors
function renderForm(argument) {
    var template = $("#form-template").html();
    var formTemplate = Handlebars.compile(template)
    $('#page-form').html(formTemplate)
    
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
            error += 'Content cant be blank. '
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


