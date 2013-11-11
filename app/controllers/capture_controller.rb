class GithubController < ApplicationController 

	require 'temboo'
	require 'Library/Github'


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

end 

