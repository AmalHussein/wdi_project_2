class Repo < ActiveRecord::Base
	has_and_belongs_to_many :gemms

	# Overloading the as_json method
	# to include gemms in the json object returned
	# as_json is automatically called when you return json
	def as_json(options={})
		super(options.merge(include: :gemms))
	end
end
