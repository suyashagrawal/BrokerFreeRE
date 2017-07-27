class PropertiesController < ApplicationController
  add_breadcrumb "home", :root_path
  add_breadcrumb "Search Result", :search_path
  def show
    @property = Property.includes(:additional_feature, :interior_feature, :location).where(id: params[:id]).first
    add_breadcrumb "Property Detail", property_path(@property)
  end

  def locations
    render json: (Location.get_locations params[:term]).map(&:full_address)
  end
end