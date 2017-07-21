class PropertiesController < ApplicationController

  def show
    @property = Property.includes(:additional_feature, :interior_feature, :location).where(id: params[:id]).first
  end

  def locations
    render json: (Location.get_locations params[:term]).map(&:full_address)
  end
end