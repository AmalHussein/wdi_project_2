class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :resource
  before_save :voted?

  private

  def voted?
    # return true if a user has already voted on a particular
    # resource, false otherwise
  end
end
