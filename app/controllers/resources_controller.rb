class ResourcesController < ApplicationController

	def create
    @resource = Resource.new(resource_params)
    # Still need to associate current user
    if @resource.save
      respond_to do |format|
        format.js
      end
    else
      # failure -- what to do here?
    end
	end 



	# add in method for up and downs of resources
	def vote
	end

  private

  def resource_params
    params.require(:resource).permit(:site_name, :site_url, :gemm_id)
  end

end