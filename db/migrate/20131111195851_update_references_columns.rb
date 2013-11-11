class UpdateReferencesColumns < ActiveRecord::Migration
  def change
    # add_column table_name, :column_name, :column_type
    # rename_column :table_name, :old_column, :new_column
    add_column :references, :downloads, :integer
    add_column :references, :version, :string
    add_column :references, :authors, :string
    add_column :references, :project_url, :string
    add_column :references, :dependencies, :string
  end
end
