class Seller < ApplicationRecord
  belongs_to :location
  
  validates :first_name, :last_name, presence: true

  def save_with_address location_params
    address = Location.create(location_params)
    self.location = address
    save
  end
end
