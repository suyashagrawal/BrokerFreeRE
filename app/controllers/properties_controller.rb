class PropertiesController < ApplicationController

  def show
    @property = Property.includes(:additonal_feature, :interior_feature, :location).where(id: params[:id]).first
  end
end