class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :country
      t.integer :zipcode
    end
  end
end
