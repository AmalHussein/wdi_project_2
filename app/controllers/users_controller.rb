class UsersController < ApplicationController

	def callback
		result = RestClient.post("https://github.com/login/oauth/access_token",
			{client_id: ENV['CLIENT_ID'],
				client_secret: ENV['CLIENT_SECRET'],
				code: params[:code]
				},{
					:accept => :json
					});
		@@access_token = JSON.parse(result)['access_token']
		redirect_to '/users/create'
	end

	def create
		github_user = JSON.parse(RestClient.get("https://api.github.com/user", {params: {:access_token => @@access_token}}))
			user = User.where(login: github_user['login']).first
			binding.pry
			unless user
				user = User.create!(login: github_user['login'], github_id: github_user['id'], url: github_user['url'])
			end
			binding.pry
			# user = User.find_or_create_by(login: user_info['login'])
			redirect_to "/sessions/#{user.id}/create"
    end

 #  # using this to save a new user to the database, or update profile for recurring user 
	# def load
	# 	user = Rails.cache.fetch("#{params['access_token']}", :expires_in => 9000.seconds) do 
	# 		JSON.parse(RestClient.get("https://api.github.com/user", {params: {:access_token => params[:access_token]}}))
	# 	end

	# 	stored_user = User.where(github_id: user['id']).first
	# 	if stored_user
	# 		unless stored_user.updated_at == user['updated_at']
	# 			stored_user.update_attributes(
	# 				name: user['name'],
	# 				login: user['login'],
	# 				url: user['url'],
	# 				html_url: user['html_url'],
	# 				repos_url: user['repos_url'],
	# 				gists_url: user['gists_url'],
	# 				avatar_url: user['avatar_url'],
	# 				public_repos: user['public_repos'],
	# 				github_id: user['id'],
	# 				followers: user['followers'],
	# 				following: user['following'],
	# 				created_at: user['created_at'],
	# 				updated_at: user['updated_at'],
	# 				email: user['email']
	# 			)
	# 		end
	# 	else
	# 		stored_user = User.create(
	# 			name: user['name'],
	# 			login: user['login'],
	# 			url: user['url'],
	# 			html_url: user['html_url'],
	# 			repos_url: user['repos_url'],
	# 			gists_url: user['gists_url'],
	# 			avatar_url: user['avatar_url'],
	# 			public_repos: user['public_repos'],
	# 			github_id: user['id'],
	# 			followers: user['followers'],
	# 			following: user['following'],
	# 			created_at: user['created_at'],
	# 			updated_at: user['updated_at'],
	# 			email: user['email']
	# 		)
	# 	end
	# 	redirect_to create_session_path(id: stored_user.id, access_token: params[:access_token])
	# end

  #       def show
  #       	@user = User.where(params[:id])
  #       	@repo = Octokit.repo("AmalHussein/wdi_project_2")
  #   # @repos = @user.repos
  #   # @repos.sort! {|a,b| a.main_language <=> b.main_language}
  #   # @repos = @user.repos.to_json.html_safe
  #   # @user = @user.to_json.html_safe
  # end

end