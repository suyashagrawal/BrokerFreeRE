class Location < ApplicationRecord
  # associations
  has_one :property

  # validations
  validates :address_line1, :city, :country, :zipcode, presence: true
end
