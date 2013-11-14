var GitSee = {};

GitSee.render_resource = function(resource_data) {
  $('resource-container').append(
    "<div id=\"post-" + resource_data.id + "\">" +
    "<div>" + resource_data.site_name + "</div>" +
    "<div>" + resource_data.site_url + "</div>" +
    "<div>" + resource_data.site_description + "</div>"
  );
};

GitSee.ajax_resource = function(github_user, github_repo, resource_name, resource_link, resource_desc) {
  var url = "/repo/" + github_user + "/" + github_repo;
  $.ajax({
    url: url,
    dataType: 'json',
    data: { site_name: resource_name, 
            site_url: resource_link,
            site_description: resource_desc },
    type: 'POST',
    success: function(resource_data) {
      GitSee.render_resource(resource_data);
    }
  });
};

GitSee.add_new_resource = function() {
  var resource_name, resource_link, resource_desc;
  resource_name = $('#resource-form-name').val();
  resource_link = $('#resource-form-url').val();
  resource_desc = $('#resource-form-desc').val();

  $('#resource-form-name').val('');
  $('#resource-form-url').val('');
  $('#resource-form-desc').val('');

  GitSee.ajax_resource(github_user, github_repo, resource_name, resource_link, resource_desc);
};


$(function() {
  $('resource-create-form').click(function(e){
    e.preventDefault();
    GitSee.add_new_resource();
  });
});