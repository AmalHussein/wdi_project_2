class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
    		t.string :repo_name
    		t.string :repo_username
      t.timestamps
    end
  end
end
