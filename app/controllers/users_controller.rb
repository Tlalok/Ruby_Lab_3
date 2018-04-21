class UsersController < ApplicationController
  
  def index
    render json: User.all
  end

  def show
    user_id = params[:id]
    render json: User.find(user_id)
  end

  def create
    user = User.new
    user.name = params[:name]
    user.second_name = params[:second_name]
    user.password = params[:password]
    user.phone = params[:phone]
    user.email = params[:email]
    user.save
    render json: user
  end

  def get_trips
    user_id = params[:id]
    user = User.find(user_id)
    render json: user.trips
  end

  def favourite_destination
    user_id = params[:id]
    airport_visits = User.find(user_id).trips.group(:airport_to).count
    render json: city_visits.max_by{|airport, visits| visits}
  end

end
