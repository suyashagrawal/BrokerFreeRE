class HomeController < ApplicationController
  before_action :search
  add_breadcrumb "home", :root_path
  add_breadcrumb "Search Result", :search_path
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