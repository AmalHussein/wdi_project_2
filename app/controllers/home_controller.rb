class HomeController < ApplicationController
	def index
		if current_user
			redirect_to user_profile_path
		end
	end


	def show
	end 

end
