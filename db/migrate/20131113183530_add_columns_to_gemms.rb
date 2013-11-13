class AddColumnsToGemms < ActiveRecord::Migration
	def change
		add_column :gemms, :real_name, :string
		add_column :gemms, :version_downloads, :string
		add_column :gemms, :gem_uri, :text
		add_column :gemms, :homepage_uri, :text
		add_column :gemms, :wiki_uri, :text
		add_column :gemms, :mailing_list_uri , :text
		add_column :gemms, :source_code_uri, :text
		add_column :gemms, :bug_tracker_uri, :text
	end
end 



