class RenameColumnNameInProperties < ActiveRecord::Migration[5.1]
  def change
  rename_column :properties, :Total_sq_feet_area, :sq_feet_area
  end
end
