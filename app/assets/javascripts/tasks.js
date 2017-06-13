var formTemplate

// $(function() {
//     template = $("#form-template").html();
//     formTemplate = Handlebars.compile(template)
// })

function renderForm(argument) {
    template = $("#form-template").html();
    formTemplate = Handlebars.compile(template)
    $('#page-form').html(formTemplate)
}




function jsForm(event) {
  event.preventDefault();
  var values = $(this).serialize();
  // var posting = $.post('/posts', values);
  console.log(values)
  console.log(this)
};

