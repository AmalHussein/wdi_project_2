class Gemm < ActiveRecord::Base
	has_many :repos


  #before_create :fetch_gem_info
  # Before we save to the database, 
  # def fetch_gem_info
  #   # If the gem isn't in the database, fetch info from Github
  # end
end
