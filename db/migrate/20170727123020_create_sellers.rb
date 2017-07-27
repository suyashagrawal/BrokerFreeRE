class CreateSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact
      t.timestamps
    end
  end
end