class CreateGemmsReposJoinTable < ActiveRecord::Migration
	def change
		create_table :gemms_repos, id: false do |t|
			t.belongs_to :gemm
			t.belongs_to :repo
		end
		add_index :gemms_repos, :gemm_id
		add_index :gemms_repos, :repo_id
		add_index :gemms_repos, [:gemm_id, :repo_id]
	end 

end

