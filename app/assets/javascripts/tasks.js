function renderForm(argument) {
    var template = $("#form-template").html();
    var formTemplate = Handlebars.compile(template)
    $('#page-form').html(formTemplate)
    
    $('#close-form').click(function(){
       $('#month-page-form').remove()
       getAndShowMonth()
    })
    
    $(function () {
      $('form').submit(function(event) {
        event.preventDefault();
        var values = $(this).serialize();
        var posting = $.post('/months/30/tasks.json', values);
        
        posting.done(function(data) {
          showMonth(data)
          $('#page-form').empty()
        });
    });
  });
}


