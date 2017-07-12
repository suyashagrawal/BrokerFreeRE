class CreatePictures < ActiveRecord::Migration[5.1]
  create_table :pictures do |t|
    t.string :picture
    t.integer :property_id
  end
  add_index :pictures, :property_id
end
