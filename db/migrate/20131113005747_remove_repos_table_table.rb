class RemoveReposTableTable < ActiveRecord::Migration
  def change
  	drop_table :repos_tables 
  end
end
