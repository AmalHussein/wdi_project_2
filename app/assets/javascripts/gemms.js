// hides empty links in gemm show view
$(document).ready(function() { 
  $('span.docbox:empty').parent().hide(); 
});