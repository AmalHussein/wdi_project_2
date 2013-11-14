class ReposController < ApplicationController

  def show 
    @resource = Resource.new
    @repo = Repo.find_or_create_by(repo_username: params[:github_user], repo_name: params[:github_repo])
    respond_to do |format|
      format.js
      format.html {@repo}
    end 
  end 




  #not using just reference, 
  # def repos	
  # 	github = Github.new client_id: ENV['CLIENT_ID'] , client_secret: ENV['CLIENT_SECRET']
  # 	tree = github.git_data.trees.get 'AmalHussein' , 'wdi_project_2', 'master' , recursive: true
  # 	paths = tree['tree'].map(&:path)
  # 	@grouped = paths.group_by { |p| File.dirname(p) }
  # 	@grouped.each do |dir, paths|
  # 		paths.delete_if { |path| @grouped.has_key? path }
  # 		paths.map! { |path| File.basename(path) }	
  # 	end
  #   @grouped.delete_if { |dir, paths| paths.empty? }

  # end 

end 
