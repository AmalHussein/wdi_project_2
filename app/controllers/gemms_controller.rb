class GemmsController < ApplicationController


  def index
    @gems = ['gems','twitter','slop','doorkeeper','rspec']
  end 

  def show
    # jem_name = "pry"
    # jem_info = Gems.search jem_name
  end

  def new

  end
end
