class Resource < ActiveRecord::Base
	belongs_to :gemm
	belongs_to :user
	has_many :votes

	def total_votes
		self.votes.where(up: true).count - self.votes.where(down: true).count
	end
end
