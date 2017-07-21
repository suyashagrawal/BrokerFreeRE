class AddNameToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :name, :string
  end
end
