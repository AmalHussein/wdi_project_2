class GemmsController < ApplicationController
  respond_to :html, :json

  def show
    @gemm = Gemm.find(params[:gemm_name])
    respond_with @gemm
  end

#   def index
#     @gems = Gemm.all
#   end

#   def show
#     # jem_name = "pry"
#     # jem_info = Gems.search jem_name
#   end

#   def new
#     @gem = Gemm.new
#   end

#   def create
#     @gem = Gemm.new(gem_params)
#     if @gem.save 
#       redirect_to @gem
#     else 
#       render action: 'new'
#     end 
#   end

#   def destroy
#     @gem.destroy
#   end

#   private

#   def gem_params
#     params.require(:name).permit(:documentation_url, :description, :downloads, :authors, :project_url, :dependencies, :language, :cosa)
#   end 
end