class CreateInteriorFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :interior_features do |t|
      t.string :flooring
      t.string :cooling
      t.string :heating
      t.string :appliance
      t.integer :guest_facilities
      t.boolean :basement
      t.string :security
      t.integer :property_id
    end
    add_index :interior_features, :property_id
  end
end
