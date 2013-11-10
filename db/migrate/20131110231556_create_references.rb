class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
    	t.string :gem_name
    	t.string :url 
    	t.string :frequency
    	t.string :category
        t.text   :description
    	t.string :color
    	t.timestamps
    end
  end
end
