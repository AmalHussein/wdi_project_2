var GitSee = {}; 
 
GitSee.render_gems = function(gemm_data) {

  var gems = gemm_data.gemms;
  $('.gems').empty();
  $.each(gems, function(index, gem){
    $('.gems').append("<div id=\"gemm-" + gem.id + "\">" + 
    "<h3>" + gem.name + "</h3>" +
    "<div>" + gem.documentation_url + "</div>" +
    "<div>" + gem.project_url + "</div>" 
    + "</div>");
  })
    var github_user = $('#github_user').val(""),
      github_repo = $('#github_repo').val("");
  
};

GitSee.jquery_ajax_load = function(github_user, github_repo) { 
  var url = "/repo/" + github_user + "/" + github_repo; 
  $.ajax({
    url: url, 
    dataType: 'json', 
    type: 'GET', 
    success: function(gemm_data){
      GitSee.render_gems(gemm_data);
    }
  });
};

GitSee.get_user_input = function(){
  var github_user = $('#github_user').val(),
      github_repo = $('#github_repo').val();
  GitSee.jquery_ajax_load(github_user, github_repo);
};

$(function() {
  $('#search-button').click(function(e) {
    e.preventDefault();
    GitSee.get_user_input();
  });
});



