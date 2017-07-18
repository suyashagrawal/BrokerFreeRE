class AddColumnsToProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :rent, :boolean, default: false
    add_column :properties, :sale, :boolean, default: false
    add_column :properties, :rent_per_month, :decimal
  end
end
