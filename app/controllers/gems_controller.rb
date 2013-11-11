class GemsController < ApplicationController


  def index
    @gems = ['pry','HTTparty','slop','doorkeeper','rspec']
    @gems.each do |my_gem|
      @gem = (Gems.search my_gem).first
    end

    @gem = (Gems.search 'rails').first
  end 

  def show
    
  end

  def new

  end
end
