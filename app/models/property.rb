class Property < ApplicationRecord
  # associations
  belongs_to :property_type
  belongs_to :location

  has_one :interior_feature
  has_one :additional_feature

  has_many :pictures

  # validations  
  validates :full_bedrooms, :full_baths, :price, :partial_bedrooms, :partial_baths, :status, :sq_feet_area, :location, :name, presence: true
  
  # results per page
  paginates_per 5

  # rails_admin
  rails_admin do
   exclude_fields :interior_feature, :additional_feature, :pictures
  end

  scope :rent, -> { where(rent: true) }
  scope :sale, -> { where(sale: true) }

  def self.search params
    self.by_type(params[:type])
    .in_between_price(params[:min_price], params[:max_price])
    .by_bedroom(params[:bedroom])
    .by_bathroom(params[:bath])
    .by_location(params[:location])
    .sorting(params[:sort])
  end

  def self.by_type type
    type.present? ? joins(:property_type).where("property_types.name = ?", type) : all
  end

  def self.in_between_price min_price, max_price
    min_price = min_price.present? ? min_price : 0
    in_price = where("price >= ?", min_price)
    in_price= in_price.where("price <= ?", max_price) if max_price.present?
    in_price
  end

  def self.by_bedroom no_of_rooms
    no_of_rooms.present? ? where("full_bedrooms + partial_bedrooms >= ?", no_of_rooms) : all
  end

  def self.by_bathroom no_of_rooms
    no_of_rooms.present? ? where("full_baths + partial_baths >= ?", no_of_rooms) : all
  end

  def self.by_location location_string
    location_string.present? ? joins(:location).where("lower(concat_ws(', ', locations.address_line1, locations.address_line2, locations.city, locations.state, locations.zipcode, locations.country)) LIKE ?", "%#{location_string.downcase}%") : joins(:location).all
  end

  def self.sorting sort_type
    sort_type == "Least Expensive" ? order(:price) : order(:price).reverse_order
  end
end