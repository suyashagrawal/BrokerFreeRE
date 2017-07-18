class Location < ApplicationRecord
  # associations
  has_one :property

  # validations
  validates :address_line1, :city, :country, :zipcode, presence: true

  def full_address
    [address_line1, address_line2, city].reject(&:blank?).join(", ") 
  end
end
