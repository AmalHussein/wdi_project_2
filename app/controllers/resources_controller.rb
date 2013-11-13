class ResourcesController < ApplicationController
  respond_to :html, :json

	def create
    
    @resource = Resource.new(site_name: params[:name], site_url: params[:url], site_description: params[:description])
    respond_with @resource
	end 

	#add in method for up and downs of resources
	def vote
	end 

end