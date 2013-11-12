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
			user = User.updateOrCreate(user_info)
			redirect_to "/sessions/#{user.id}/create"
          # decide whether or not to add repos at this time
        end

        def show
        	@user = User.where(params[:id])
        	@repo = Octokit.repo("AmalHussein/wdi_project_2")
    # @repos = @user.repos
    # @repos.sort! {|a,b| a.main_language <=> b.main_language}
    # @repos = @user.repos.to_json.html_safe
    # @user = @user.to_json.html_safe
  end

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