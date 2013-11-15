class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :gravatar_id , :integer 
  	add_column :users, :followers_url, :string
  	add_column :users, :following_url, :string 
  	add_column :users, :starred_url, :string
  	add_column :users, :subscriptions_url, :string
  	add_column :users, :organizations_url, :string
  	add_column :users, :events_url, :string
  	add_column :users, :received_events_url, :string
  	add_column :users, :type, :string
  	add_column :users, :site_admin, :string
  	add_column :users, :public_gists, :string
  	add_column :users, :created_profile, :datetime
  	add_column :users, :last_updated_at, :datetime
  end
end
