var GitSee = {}; 

// var render_tweets = function(tweets_json_array) {
//   var tweets;
//    tweets = $.parseJSON(tweets_json_array);
//   $.each(tweets, function(index, tweet) {
//     $('#tweet-list').append('<li class="one-tweet">' + tweet + '</li>');
//   })
// };

GitSee.render_gems = function(gemm_data) { 
  var gems; 
  gems = $.parseJSON(gemm_data);
  $.each(gems, function(index, gem){
    $('#gems').append("<div id=\"gemm-" + gem.id + "\">" + 
    "<h3>" + gem.name + "</h3>" +
    "<div>" + gem.documentation_url + "</div>" +
    "<div>" + gem.project_url + "</div>" 
    + "</div>")
  })
};

GitSee.jquery_ajax_load = function(github_user, github_repo) { 
  var url = "/repo/" + github_user + "/" + github_repo; 
  $.ajax({
    url: url, 
    dataType: 'json', 
    type: 'GET', 
    success: function(data){
      alert('hi from success story!');
      GitSee.render_gems(data);
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



