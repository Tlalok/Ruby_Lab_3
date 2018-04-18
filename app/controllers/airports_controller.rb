class AirportsController < ApplicationController

  def index
    render json: Airport.all
  end

  def show
    airport_id = params[:id]
    render json: Airport.find(airport_id)
  end

  def most_visitable
    airport_visits = Airport.joins("left join trips on airports.id = trips.airport_to_id").group(:airport_to).count
    render json: city_visits.max_by{|airport, visits| visits}
  end

end
