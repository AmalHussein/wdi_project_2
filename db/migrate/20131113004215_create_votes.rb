class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.integer :up_votes
  		t.integer :down_votes
  		t.belongs_to :user
  		t.belongs_to :resource
  	end 

  end
end
