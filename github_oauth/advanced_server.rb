require 'sinatra/auth/github'
require 'rest-client'
require 'pry'
require 'github_api'
require 'octokit'


module Example
  class MyBasicApp < Sinatra::Base
    # !!! DO NOT EVER USE HARD-CODED VALUES IN A REAL APP !!!
    # Instead, set and test environment variables, like below
    
    # if ENV['GITHUB_CLIENT_ID'] && ENV['GITHUB_CLIENT_SECRET']
    #  CLIENT_ID        = ENV['GITHUB_CLIENT_ID']
    #  CLIENT_SECRET    = ENV['GITHUB_CLIENT_SECRET']
    # end

    CLIENT_ID = '8476104fa8cf26b28392'
    CLIENT_SECRET = '8802502e1d7cc5b5418777a2e2e99634a0ac273d'

    # binding.pry

    enable :sessions

    set :github_options, {
      :scopes    => "user",
      :secret    => CLIENT_SECRET,
      :client_id => CLIENT_ID,
      :callback_url => "/callback"
    }

    register Sinatra::Auth::Github


    get '/' do
      if !authenticated?
        authenticate!
      else
        access_token = github_user["token"]
        auth_result = RestClient.get("https://api.github.com/user", {:params => {:access_token => access_token, :accept => :json}, 
                                                                                  :accept => :json})
        auth_result = JSON.parse(auth_result)

        erb :advanced, :locals => {:login => auth_result["login"],
                                   :hire_status => auth_result["hireable"] ? "hireable" : "not hireable"}
      end
    end

    get '/callback' do
      if authenticated?
        redirect "/"
      else
        authenticate!
      end
    end


    get '/:scopes' do 
      erb :index 
    end



  end
end
