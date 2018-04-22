class AirportsController < ApplicationController

  before_action :set_airport, only: [:show, :update, :destroy]

  def index
    render json: Airport.all
  end

  def show
    render json: @airport
  end

  def create
    airport = Airport.create!(airport_params)
    render json: airport
  end

  def update
    @airport.update!(airport_params)
    head :ok
  end

  def destroy
    render json: @airport.destroy!
  end

  def most_visitable
    airport = Airport.all.max { |a, b| a.trips_to.count <=> b.trips_to.count }
    render json: airport
  end

private 

  def set_airport
    @airport = Airport.find(params[:id])
  end

  def airport_params
    params.require([:name, :place_count, :town_id])
    params.permit(:name, :place_count, :town_id)
  end

end
