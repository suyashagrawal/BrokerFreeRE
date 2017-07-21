class RenameTableAdditonalFeatures < ActiveRecord::Migration[5.1]
  def change
    rename_table :additonal_features, :additional_features
  end
end