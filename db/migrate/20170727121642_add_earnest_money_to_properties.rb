class AddEarnestMoneyToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :earnest_money, :decimal
  end
end