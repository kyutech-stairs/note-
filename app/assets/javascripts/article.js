$(document).ready(function(){
   $('.dropdown-trigger').dropdown();
   $('.fixed-action-btn').floatingActionButton();
   $('.tooltipped').tooltip();
   $('.modal').modal();
   $('select').formSelect();
   $('.select-dropdown').prop('disabled', true);
   $('input[type="checkbox"]').change(function() {
      if ($(this).prop('checked')) {
        $('.select-dropdown').prop('disabled', true);
      } else {
        $('.select-dropdown').prop('disabled', false);
      }
   });
 });
