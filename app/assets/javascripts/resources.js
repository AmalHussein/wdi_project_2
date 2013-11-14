var GitSee = {};

GitSee.render_resource = function(resource_data) {
  $('resource-container').append(
    "<div id=\"resource-" + resource_data.id + "\">" +
    "<a href=" + resource_data.site_url + ">" +
    resource_data.site_name + "</a>" +
    "<div>" + resource_data.site_description + "</div>" +
    "</div>"
  );
};

GitSee.ajax_resource = function(resource_name, resource_link, resource_desc, github_user, github_repo) {
  // currently hardcoded to 'repo/rubygems/gems'
  var url = "/repo/" + github_user + "/" + github_repo; 
  $.ajax({
    url: '/',
    dataType: 'json',
    data: { site_name: resource_name, 
            site_url: resource_link,
            site_description: resource_desc },
    type: 'POST',
    success: function(resource_data) {
      GitSee.render_resource(resource_data);
    }
  });
  debugger;
};

GitSee.add_new_resource = function() {
  var resource_name = $('#resource-form-name').val(),
      resource_link = $('#resource-form-url').val(),
      resource_desc = $('#resource-form-desc').val(),
      github_user = 'rubygems', // currently
      github_repo = 'gems';     // hardcoded
  
  $('#resource-form-name').val('');
  $('#resource-form-url').val('');
  $('#resource-form-desc').val('');

  GitSee.ajax_resource(resource_name, resource_link, resource_desc, github_user, github_repo);
};


$(function() {
  $('#resource-create-form').click(function(e) {
    e.preventDefault();
    GitSee.add_new_resource();
  });
});