AceEditorEmbedTest::Application.routes.draw do
 root 'home#index'
 get '/repo/:github_user/:github_repo' => 'repos#show'
 get '/gem/:gemm_name' => 'gemms#show'
 post '/resource/create'=> 'resource#create'
 post '/resource/:id:/vote' => 'resource#vote'

 #Routes for GitHub Oauth need refine and clean up
 get '/callback' => 'users#callback'
 get '/sessions/:id/create' => 'sessions#create', as: 'create_user_session'
 get '/sessions/:id/destroy' => 'sessions#destroy', as: 'destroy_user_session'
 get '/users/create' => 'users#create', as: 'create_user'
 get '/users/:id' => 'users#show', as: 'user'
 get '/select/:login' => 'welcome#select', as: 'select'
end
