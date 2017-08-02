class AddFinishedAreaToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :finished_sq_feet, :decimal
  end
end