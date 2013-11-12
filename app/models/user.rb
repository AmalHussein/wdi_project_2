class User < ActiveRecord::Base
	require 'octokit'
	require 'rest-client'
	require 'github_api'

	def list_repos
		github = Github.new client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET']
		tree = github.git_data.trees.get 'AmalHussein', 'wdi_project_2', 'master', recursive: true
    @links = tree['tree'].map(&:path)
	end 
end   



		# @tree = JSON.parse(RestClient.get("https://api.github.com/repos/AmalHussein/wdi_project_2/git/trees/master?recursive=1"))	
