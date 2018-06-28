$(function(){
  if ( $('#title').val().length == 0) {
    $('#submit').prop('disabled', true);
  }
  $('input[type="text"]').on('keydown keyup keypress change', function() {
    console.log("fff");
    var btn = document.getElementById('submit');
    if ( $(this).val().length > 0 ) {
      btn.removeAttribute('disabled');
    } else {
      btn.setAttribute('disabled', 'disabled');
    }
  });
});
