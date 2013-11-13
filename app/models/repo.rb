class Repo < ActiveRecord::Base
	has_and_belongs_to_many :gemms

	def as_json(options={})
		super(options.merge(include: :gemms))
	end
end
