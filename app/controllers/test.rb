 def repos
  	#binding.pry
		github = Github.new client_id: ENV['CLIENT_ID'] , client_secret: ENV['CLIENT_SECRET']
		tree = github.git_data.trees.get 'AmalHussein' , 'wdi_project_2', 'master' , recursive: true
		@links = tree['tree'].map(&:path)
	end 
	







