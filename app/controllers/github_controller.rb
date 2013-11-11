class GithubController < ApplicationController 

	require 'temboo'
	require 'Library/Github'

	def InitializeOAuth
		@session = TembooSession.new("amalhussein", "myFirstApp", "e50c2e0d-5067-45fa-a")

		@initializeOAuthChoreo = GitHub::OAuth::InitializeOAuth.new(@session)

		# Get an InputSet object for the choreo
		@initializeOAuthInputs = @initializeOAuthChoreo.new_input_set()

		# Set inputs
		@initializeOAuthInputs.set_ClientID("8476104fa8cf26b28392");

		# Execute Choreo
		@initializeOAuthResults = @initializeOAuthChoreo.execute(@initializeOAuthInputs)
	end

	def FinalizeOAuth
		@session = TembooSession.new("amalhussein", "myFirstApp", "e50c2e0d-5067-45fa-a")
		
		# Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
		# session = TembooSession.new("amalhussein", "APP_KEY_NAME", "APP_KEY_VALUE")
		@finalizeOAuthChoreo = GitHub::OAuth::FinalizeOAuth.new(session)

		# Get an InputSet object for the choreo
		@finalizeOAuthInputs = @finalizeOAuthChoreo.new_input_set()

		# Set inputs
		@finalizeOAuthInputs.set_CallbackID("amalhussein/62abb59e-e9f3-4de1-a0cf-eca535df726a");
		@finalizeOAuthInputs.set_ClientSecret("8802502e1d7cc5b5418777a2e2e99634a0ac273d");
		@finalizeOAuthInputs.set_ClientID("8476104fa8cf26b28392");

		# Execute Choreo
		@finalizeOAuthResults = @finalizeOAuthChoreo.execute(@finalizeOAuthInputs)

	end

# 	def initialize()
# 		@session = TembooSession.new("amalhussein", "myFirstApp", "e50c2e0d-5067-45fa-a")

# 	end

# 	def initial_oauth 
# 	@initializeOAuthChoreo = GitHub::OAuth::InitializeOAuth.new(@session)

# 	# Get an InputSet object for the choreo
# 	@initializeOAuthInputs = @initializeOAuthChoreo.new_input_set()

# 	# Set inputs
# 	@initializeOAuthInputs.set_ClientID("8476104fa8cf26b28392");

# 	# Execute Choreo
# 	@initializeOAuthResults = @initializeOAuthChoreo.execute(@initializeOAuthInputs)

# end 


# def final_oauth

# # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
# # session = TembooSession.new("amalhussein", "APP_KEY_NAME", "APP_KEY_VALUE")
# @finalizeOAuthChoreo = GitHub::OAuth::FinalizeOAuth.new(session)

# # Get an InputSet object for the choreo
# @finalizeOAuthInputs = @finalizeOAuthChoreo.new_input_set()

# # Set inputs
# @finalizeOAuthInputs.set_CallbackID("amalhussein/62abb59e-e9f3-4de1-a0cf-eca535df726a");
# @finalizeOAuthInputs.set_ClientSecret("8802502e1d7cc5b5418777a2e2e99634a0ac273d");
# @finalizeOAuthInputs.set_ClientID("8476104fa8cf26b28392");

# # Execute Choreo
# @finalizeOAuthResults = @finalizeOAuthChoreo.execute(@finalizeOAuthInputs)


# end 

# # # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
# # session = TembooSession.new("amalhussein", "myFirstApp", "e50c2e0d-5067-45fa-a")
# # initializeOAuthChoreo = GitHub::OAuth::InitializeOAuth.new(session)

# # # Get an InputSet object for the choreo
# # initializeOAuthInputs = initializeOAuthChoreo.new_input_set()

# # # Set inputs
# # initializeOAuthInputs.set_ClientID("8476104fa8cf26b28392");

# # # Execute Choreo
# # initializeOAuthResults = initializeOAuthChoreo.execute(initializeOAuthInputs)

# # # -----
# # # # access token d738231a9f55a46f09e5d86b41269ae8669f6c5c
# # # -----
# # # Instantiate the Choreo, using a previously instantiated TembooSession object, eg:
# # # session = TembooSession.new("amalhussein", "APP_KEY_NAME", "APP_KEY_VALUE")
# # finalizeOAuthChoreo = GitHub::OAuth::FinalizeOAuth.new(session)

# # # Get an InputSet object for the choreo
# # finalizeOAuthInputs = finalizeOAuthChoreo.new_input_set()

# # # Set inputs
# # finalizeOAuthInputs.set_CallbackID("amalhussein/62abb59e-e9f3-4de1-a0cf-eca535df726a");
# # finalizeOAuthInputs.set_ClientSecret("8802502e1d7cc5b5418777a2e2e99634a0ac273d");
# # finalizeOAuthInputs.set_ClientID("8476104fa8cf26b28392");

# # # Execute Choreo
# # finalizeOAuthResults = finalizeOAuthChoreo.execute(finalizeOAuthInputs)






# # # module Example
# # #   class MyBasicApp < Sinatra::Base
# # #     # !!! DO NOT EVER USE HARD-CODED VALUES IN A REAL APP !!!
# # #     # Instead, set and test environment variables, like below
    
# # #     # if ENV['GITHUB_CLIENT_ID'] && ENV['GITHUB_CLIENT_SECRET']
# # #     #  CLIENT_ID        = ENV['GITHUB_CLIENT_ID']
# # #     #  CLIENT_SECRET    = ENV['GITHUB_CLIENT_SECRET']
# # #     # end

# # #     CLIENT_ID = '8476104fa8cf26b28392'
# #     CLIENT_SECRET = '8802502e1d7cc5b5418777a2e2e99634a0ac273d'

# #     # binding.pry

# #     enable :sessions

# #     set :github_options, {
# #       :scopes    => "user",
# #       :secret    => CLIENT_SECRET,
# #       :client_id => CLIENT_ID,
# #       :callback_url => "/callback"
# #     }

# #     register Sinatra::Auth::Github


# #     get '/' do
# #       if !authenticated?
# #         authenticate!
# #       else
# #         access_token = github_user["token"]
# #         auth_result = RestClient.get("https://api.github.com/user", {:params => {:access_token => access_token, :accept => :json}, 
# #                                                                                   :accept => :json})
# #         auth_result = JSON.parse(auth_result)

# #         erb :advanced, :locals => {:login => auth_result["login"],
# #                                    :hire_status => auth_result["hireable"] ? "hireable" : "not hireable"}
# #       end
# #     end

# #     get '/callback' do
# #       if authenticated?
# #         redirect "/"
# #       else
# #         authenticate!
# #       end
# #     end


# #     get '/:scopes' do 
# #       erb :index 
# #     end



# #   end
# # end

# end 

