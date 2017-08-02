class SellerStepsController < ApplicationController
	include Wicked::Wizard
  steps :address, :personal_details, :property_details, :price, :earnest_money, :title_company, :payment, :thank_you
  
  def show
    case params[:id]
    when 'address'
      @location = set_location
    when 'personal_details'
      @location = set_location
      @seller =  set_seller
    when 'property_details'
      @property = set_property
    when 'price'
      @property = Property.where(id: session[:property_id]).first
    when 'earnest_money'
      @property = Property.where(id: session[:property_id]).first
    when 'title_company'
      @property = Property.where(id: session[:property_id]).first
    end
    render_wizard
  end

  def update
    case params[:id]
    when 'address'
      create_property_location
    when 'personal_details'
      create_seller_with_address
    when 'property_details'
      create_property
    when 'price'
      update_price
    when 'earnest_money'
      update_earnest_money
    when 'title_company'
      update_title_company
    when 'payment'
      update_payment
    end
  end

  private

  def location_params
    params.require(:location).permit(:address_line1, :address_line2, :city, :country, :state, :zipcode)
  end

  def seller_params
    params.require(:seller).permit(:first_name, :last_name, :email, :contact)
  end

  def property_params
    params.require(:property).permit(:sq_feet_area, :finished_sq_feet, :built_year, :full_bedrooms, :full_baths, :partial_bedrooms, :partial_baths, :description, :property_type_id)
  end

  def create_property_location
    @location = Location.new(location_params)
    session[:location_id] = @location.id if @location.save
    render_wizard @location
  end

  def create_seller_with_address
    @seller = Seller.new(seller_params)
    @seller.save_with_address(location_params)
    session[:seller_id] = @seller.id if @seller.save
    render_wizard @seller
  end

  def create_property
    @property = Property.new(property_params)
    @property.location = Location.where(id: session[:location_id]).first
    session[:property_id] = @property.id if @property.save
    render_wizard @property
  end

  def update_price
    @property = Property.where(id: session[:property_id]).first
    @property.price = params[:property][:price]
    render_wizard @property
  end

  def update_earnest_money
    @property = Property.where(id: session[:property_id]).first
    @property.earnest_money = params[:earnest_money]
    render_wizard @property
  end

  def update_title_company
    @property = Property.where(id: session[:property_id]).first
    @property.earnest_money = params[:earnest_money]
    @property.save
    render_wizard @property
  end

  def update_payment
    @property = Property.where(id: session[:property_id]).first
    @property.title_company = params[:title_company]
    @property.save
    render_wizard @property
  end

  def set_location
    if session[:location_id].present? && Location.where(id: session[:location_id]).present?
      Location.where(id: session[:location_id]).first
    else
      Location.new
    end
  end

  def set_property
    if session[:property_id].present? && Property.where(id: session[:property_id]).present?
      Property.where(id: session[:property_id]).first
    else
      Property.new
    end
  end

  def set_seller
    if session[:seller_id].present? && Property.where(id: session[:seller_id]).present?
      Seller.where(id: session[:seller_id]).first
    else
      Seller.new
    end
  end
end
