class RemoveColumnsFromGemms < ActiveRecord::Migration
  def change
  	remove_column :gemms, :color 
  	remove_column :gemms, :authors
  	remove_column :gemms, :dependencies
  	remove_column :gemms, :language
  	remove_column :gemms, :cosa
  end
end
