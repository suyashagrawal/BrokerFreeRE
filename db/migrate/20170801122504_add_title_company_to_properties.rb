class AddTitleCompanyToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :title_company, :string
  end
end
