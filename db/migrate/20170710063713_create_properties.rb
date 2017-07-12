class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.integer :full_bedrooms
      t.integer :full_baths
      t.integer :partial_bedrooms, default: 0
      t.integer :partial_baths, default: 0
      t.integer :property_type_id
      t.integer :location_id
      t.decimal :price
      t.decimal :Total_sq_feet_area
      t.text :description
      t.string :status
      t.integer :built_year
      t.string :view
      t.timestamps
    end

    add_index :properties, :location_id
    add_index :properties, :property_type_id
  end
end