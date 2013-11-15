AceEditorEmbedTest::Application.routes.draw do
	root 'repos#show'
	get '/repo' => 'repos#show'
	get '/repo/:github_user/:github_repo' => 'repos#show'
	get '/gem/:name' => 'gemms#show'
	post '/resource/create'=> 'resources#create', as: "create_resource"
	post '/resource/:id:/vote' => 'resources#vote'

	#Routes for GitHub Oauth need refine and clean up
	get '/users/callback' => 'users#callback'
	get '/sessions/:id/create' => 'sessions#create', as: 'create_user_session'
	get '/sessions/:id/destroy' => 'sessions#destroy', as: 'destroy_user_session'
	get 'users/load', to: 'users#load', as: 'load_user'
	get '/users/create' => 'users#create', as: 'create_user'
	get '/users/:id' => 'users#show', as: 'user'
	get '/select/:login' => 'welcome#select', as: 'select'
end
