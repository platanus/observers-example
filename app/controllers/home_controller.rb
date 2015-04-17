class HomeController < ApplicationController
  def index
    @thermometer = Thermometer.first_or_create
    @thermometer.calculate_for(params[:country])
  end
end
