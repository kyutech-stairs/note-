$(document).ready(function(){
   $('.dropdown-trigger').dropdown();
   //article new:floatbtn
   $('.fixed-action-btn').floatingActionButton();
   //article new:help
   $('.tooltipped').tooltip();
   //ariticle show:acordion
   $('.collapsible').collapsible({
     accordion: false
   });
   //purchase/price modal
   $('.modal').modal();
   //price modal
   $('select').formSelect();
   $('.select-dropdown').prop('disabled', true);

  //price modalのselectbox
   $('input[type="checkbox"]').change(function() {
      if ($(this).prop('checked')) {
        $('.select-dropdown').prop('disabled', true);
      } else {
        $('.select-dropdown').prop('disabled', false);
      }
   });
 });
