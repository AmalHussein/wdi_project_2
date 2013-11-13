class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
    	t.string :site_name
    	t.string :site_url
			t.text 		:site_description
			t.belongs_to :user
			t.belongs_to :gemm
      t.timestamps
    end
  end
end
