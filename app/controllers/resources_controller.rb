class ResourcesController < ApplicationController

	def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    if @resource.save
      respond_to do |format|
        format.js
      end
    else
      flash.now.alert = "Link Didn't Save. Check the link and try again!"
    end
  end 

	# add in method for up and downs of resources
	def vote
    @resource = Resource.find(params[:id])
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    if @vote.save 
      respond_to do |format|
        format.js 
      end
    else 
     flash.now.alert = "Try again, and make sure your logged in to vote!"

   end
 end 

 private

 def resource_params
  params.require(:resource).permit(:site_name, :site_url, :gemm_id , :user_id)
end

def vote_params
  params.require(:vote).permit(:up, :down , :total_votes :user_id , :resource_id)
end 

end