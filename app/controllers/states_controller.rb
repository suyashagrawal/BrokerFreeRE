class StatesController < ApplicationController
  def index
    states = []
    country = ISO3166::Country.find_country_by_name(params[:country_name])
    country.states.each{|k, v| states << v.name} if country.present?
    render json: { states: states }
  end
end
