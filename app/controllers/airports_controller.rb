class AirportsController < ApplicationController

  def index
    render json: Airport.all
  end

  def show
    airport_id = params[:id]
    render json: Airport.find(airport_id)
  end

  def create
    airport = Airport.new
    airport.name = params[:name]
    airport.place_count = params[:place_count]
    airport.town_id = params[:town_id]
    airport.save
    render json: airport
  end

  def most_visitable
    airport_visits = Airport.joins("join trips on airports.id = trips.airport_to_id").group(:name).count
    render json: airport_visits.max_by{|airport, visits| visits}
  end

end
