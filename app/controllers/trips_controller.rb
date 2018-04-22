class TripsController < ApplicationController

  before_action :set_trip, only: [:show, :update, :destroy]
  before_action :set_airport, only: [:trips_from, :trips_to]

  def index
    condition = ""
    args = {}
    if (params.has_key?(:start_date))
      args[:start_date] = DateTime.iso8601(params[:start_date])
      condition = "time_out >= :start_date"
    end
    if (params.has_key?(:end_date))
      condition += " AND " unless (condition.empty?)
      condition += "time_out <= :end_date"
      args[:end_date] = DateTime.iso8601(params[:end_date])
    end

    if(params.has_key?(:plane_id))
      render json: Plane.find(params[:plane_id]).trips.where(condition, args)
    elsif(params.has_key?(:user_id))
      render json: User.find(params[:user_id]).trips.where(condition, args)
    else
      render json: Trip.where(condition, args)
    end
  end

  def show
    render json: @trip
  end

  def create
    trip = Trip.create!(trip_params)
    render json: trip
  end

  def update
    @trip.update!(trip_params)
    head :ok
  end

  def destroy
    render json: @trip.destroy!
  end

  def trips_from
    render json: @airport.trips_from
  end

  def trips_to
    render json: @airport.trips_to
  end

private

  def set_trip
    @trip = Trip.find(params[:id])
  end
  
  def set_airport
    @airport = Airport.find(params[:airport_id])
  end

  def trip_params
    params.require([:time_in, :time_out, :plane_id, :airport_from_id, :airport_to_id])
    params.permit(:time_in, :time_out, :plane_id, :airport_from_id, :airport_to_id)
  end

end
