class AddLocationIdToSeller < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :location_id, :integer, index: true
  end
end
