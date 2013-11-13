var GitSee = {}; 

GitSee.render_post = function(gemm_data) { 
  $('#gems').append( 
    "<div id=\"gemm-" + gemm_data.id + "\">" + 
    "<h3>" + gemm_data.name + "</h3>" +
    "<div>" + gemm_data.documentation_url + "</div>" +
    "<div>" + gemm_data.project_url + "</div>" 
    + "</div>"

    );
};

$(document).ready(function(){
  $('#search-button').click(function(e) {
    e.preventDefault();
    GitSee.get_user_input = function(github_user, github_repo) {
      var github_user = $('#github_user').val();
      var github_repo = $('#github_repo').val();
    };
  });
  GitSee.jquery_ajax_load = function( github_user, github_repo) {
    var url = "/repo/" + github_user + "/" + github_repo; 
    $.ajax({
      url: url, 
      dataType: 'json', 
      type: 'POST', 
      success: function(data){
        GitSee.render_post(data);
      }
    });
  };
});





