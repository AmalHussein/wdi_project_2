class AddColumnsToGemmsTable < ActiveRecord::Migration
  def change
    add_column :gemms, :language, :string
    add_column :gemms, :cosa, :string
  end
end
