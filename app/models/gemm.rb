class Gemm < ActiveRecord::Base
	has_many :resources 
	has_and_belongs_to_many :repos

end
