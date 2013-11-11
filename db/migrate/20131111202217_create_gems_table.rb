class CreateGemsTable < ActiveRecord::Migration
  def change
    create_table :gemms do |t|
    t.string   "name"
    t.string   "documentation_url"
    t.string   "frequency"
    t.string   "category"
    t.text     "description"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "downloads"
    t.string   "version"
    t.string   "authors"
    t.string   "project_url"
    t.text     "dependencies"
    end
  end
end
