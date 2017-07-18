class HomeController < ApplicationController
  before_action :search
  
  def index
  end

  def search
    @properties = Property.search params
    @properties = @properties.page params[:page]
  end

  def rent
    @properties = @properties.rent
    render 'search'
  end

  def sale
    @properties = @properties.sale
    render 'search'
  end
end