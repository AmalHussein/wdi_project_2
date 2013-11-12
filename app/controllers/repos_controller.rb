class Repo < ActiveRecord::Base 

def repos	
  	github = Github.new client_id: ENV['CLIENT_ID'] , client_secret: ENV['CLIENT_SECRET']
  	tree = github.git_data.trees.get 'AmalHussein' , 'wdi_project_2', 'master' , recursive: true
  	paths = tree['tree'].map(&:path)
  	@grouped = paths.group_by { |p| File.dirname(p) }
  	@grouped.each do |dir, paths|
  		paths.delete_if { |path| @grouped.has_key? path }
  		paths.map! { |path| File.basename(path) }	
  	end
  @grouped.delete_if { |dir, paths| paths.empty? }
 
  end 

end 
