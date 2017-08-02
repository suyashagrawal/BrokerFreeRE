class AddEmailToSellers < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :email, :string
  end
end
