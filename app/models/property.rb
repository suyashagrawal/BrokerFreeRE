class Property < ApplicationRecord
  # associations
  belongs_to :property_type
  belongs_to :location

  has_one :interior_feature
  has_one :additonal_feature

  has_many :pictures

  # validations  
  validates :full_bedrooms, :full_baths, :price, :status, :Total_sq_feet_area, presence: true

  # rails_admin
  rails_admin do
    exclude_fields :interior_feature, :additonal_feature, :pictures
  end
end
