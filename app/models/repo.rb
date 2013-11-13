class Repo < ActiveRecord::Base
	# http://edgeguides.rubyonrails.org/active_record_callbacks.html
	before_validation :parse_and_store_gemms

	has_and_belongs_to_many :gemms

	# Overloading the as_json method
	# to include gemms in the json object returned
	# as_json is automatically called when you return json
	def as_json(options={})
		super(options.merge(include: :gemms))
	end

	private # can only be called from within the model

	def parse_and_store_gems
		# Using Github, get the Gemfile from the repo
		# Regex/parse the gemfile's data to get an array of gems
		# gemm_list = array_parsed_from_github_gemfile
		# gemm_list.each do |gemm|
		# 	self.gemms << Gemm.find_or_create_by(name: gemm)
		# end
	end
end
