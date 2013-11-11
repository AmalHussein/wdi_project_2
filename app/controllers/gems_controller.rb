class GemsController < ApplicationController


  def index
    @gem = (Gems.search 'pry').first
  end 

  def show
    
  end

  def new
   
  end
end
