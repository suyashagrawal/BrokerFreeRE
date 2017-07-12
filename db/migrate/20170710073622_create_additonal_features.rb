class CreateAdditonalFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :additonal_features do |t|
      t.string :face_direction
      t.integer :parking_count
      t.string :fencing
      t.string :construction_material
      t.integer :property_id
    end
    add_index :additonal_features, :property_id
  end
end
