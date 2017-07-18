class HomeController < ApplicationController
  def index
  end

  def search
    @properties = Property.search params
  end
end
