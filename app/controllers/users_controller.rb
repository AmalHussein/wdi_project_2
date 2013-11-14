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
		user = JSON.parse(RestClient.get("https://api.github.com/user", {params: {:access_token => @@access_token}}))
		user_info = {name: user['name'],
			login: user['login'],
			email: user['email'],
			access_token: @@access_token,
			avatar_url: user['avatar_url'],
			repos_count: user['public_repos']}
			user = User.find_or_create_by(login: user_info['login'])
			redirect_to "/sessions/#{user.id}/create"
    end

  # using this to save a new user to the database, or update profile for recurring user 
	def load
		github_user = Rails.cache.fetch("#{params['access_token']}", :expires_in => 9000.seconds) do 
			JSON.parse(RestClient.get("https://api.github.com/user", {params: {:access_token => params[:access_token]}}))
		end

		stored_user = User.where(github_id: github_user['id']).first
		if stored_user
			unless stored_user.updated_at == github_user['updated_at']
				stored_user.update_attributes(
					name: github_user['name'],
					login: github_user['login'],
					url: github_user['url'],
					html_url: github_user['html_url'],
					repos_url: github_user['repos_url'],
					gists_url: github_user['gists_url'],
					avatar_url: github_user['avatar_url'],
					public_repos: github_user['public_repos'],
					github_id: github_user['id'],
					followers: github_user['followers'],
					following: github_user['following'],
					created_at: github_user['created_at'],
					updated_at: github_user['updated_at'],
					email: github_user['email']
				)
			end
		else
			stored_user = User.create(
				name: github_user['name'],
				login: github_user['login'],
				url: github_user['url'],
				html_url: github_user['html_url'],
				repos_url: github_user['repos_url'],
				gists_url: github_user['gists_url'],
				avatar_url: github_user['avatar_url'],
				public_repos: github_user['public_repos'],
				github_id: github_user['id'],
				followers: github_user['followers'],
				following: github_user['following'],
				created_at: github_user['created_at'],
				updated_at: github_user['updated_at'],
				email: github_user['email']
			)
		end
		redirect_to create_session_path(id: stored_user.id, access_token: params[:access_token])
	end

  #       def show
  #       	@user = User.where(params[:id])
  #       	@repo = Octokit.repo("AmalHussein/wdi_project_2")
  #   # @repos = @user.repos
  #   # @repos.sort! {|a,b| a.main_language <=> b.main_language}
  #   # @repos = @user.repos.to_json.html_safe
  #   # @user = @user.to_json.html_safe
  # end

end