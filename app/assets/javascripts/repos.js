$(document).ready(function(){

  $('.gem-docs').hide();
  $('.gem-resources').hide();

  $('.gem-name h4').click(function(e){
   e.preventDefault();
   $('.gem-docs').show();
  })




});
