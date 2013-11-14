class AddColumnToGemms < ActiveRecord::Migration
  def change
  	add_column :gemms, :platform , :string
  end
end
