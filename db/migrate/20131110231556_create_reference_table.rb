class CreateReferenceTable < ActiveRecord::Migration
  def change
    create_table :reference_tables do |t|
    	t.string :gem_name
    	t.string :url 
    	t.string :frequency
    	t.string :catagory
    	t.string :color
    	t.timestamps
    end
  end
end
