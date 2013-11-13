class Resource < ActiveRecord::Base
		belongs_to :gemm
		belongs_to :user
end
