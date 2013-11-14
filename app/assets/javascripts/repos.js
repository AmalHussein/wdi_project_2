<<<<<<< HEAD
$(document).ready(function(){

  $('.gem-docs').hide();
  $('.gem-resources').toggle();

  $('.gem-name h4').click(function(e){
   e.preventDefault();

   $('.gem-docs').appendTo('#canvas');
   $('.gem-resources').appendTo('#canvas');
   $('.gem-docs').toggle();
   $('.gem-resources').toggle();

  })


// $('#myelement').toggle(
//  function(){
//      $('#another-element').show("slide", { direction: "right" }, 1000);
// }
// ,
// function(){
//     $('#another-element').hide("slide", { direction: "right" }, 1000);
// }
// );

});
=======
var GitSee = {}; 
>>>>>>> f5ed726948e000dff751c6887a42e8fb3ad0d502
