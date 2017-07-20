class Location < ApplicationRecord
  # associations
  has_one :property

  # validations
  validates :address_line1, :city, :country, :zipcode, presence: true

  def full_address
    [address_line1, address_line2, zipcode, city].reject(&:blank?).join(", ") 
  end

  def self.get_locations location_string
    where("lower(concat_ws(' ' , locations.address_line1, locations.address_line2, locations.zipcode, locations.city, locations.country)) LIKE ?", "%#{location_string.downcase}%")
  end
end
