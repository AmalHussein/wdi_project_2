class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end 

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
		unless user
			user = User.create!(
				login: github_user['login'],
				github_id: github_user['id'],
				url: github_user['url'] , 
				avatar_url: github_user['avatar_url'],
				gravatar_id: github_user['gravatar_id'] , 
				html_url: github_user['html_url'], 
				followers_url: github_user['followers_url'] ,
				following_url: github_user['following_url'] , 
				gists_url: github_user['gists_url'] , 
				starred_url: github_user['starred_url'] , 
				subscriptions_url: github_user['subscriptions_url'] , 
				organizations_url: github_user['organizations_url'] , 
				repos_url: github_user['repos_url'] , 
				events_url: github_user['events_url'] , 
				received_events_url: github_user['received_events_url'] , 
				type: github_user['type'], 
				site_admin: github_user['site_admin'] ,
				public_repos: github_user['public_repos'],
				followers: github_user['followers'] , 
				following: github_user['following'], 
				created_profile: github_user['created_at'] , 
				last_updated_at: github_user['updated_at'] , 
				public_gists: github_user['public_gists']) 
end
redirect_to "/sessions/#{user.id}/create"
end

end