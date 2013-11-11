class UpdateReferencesColumnNames < ActiveRecord::Migration
  def change
    rename_column :references, :url, :documentation_url
    rename_column :references, :gem_name, :name
    #removing dependencies column and making the datatype Text instead of string
    remove_column :references, :dependencies
    add_column :references, :dependencies, :text
  end
end
