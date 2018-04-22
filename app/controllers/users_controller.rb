class UsersController < ApplicationController
  
  before_action :set_user, except: [:index, :create]

  def index
    render json: User.all
  end

  def show
    render json: @user
  end

  def create
    user = User.create!(user_params)
    render json: user
  end

  def update
    @user.update!(user_params)
    head :ok
  end

  def destroy
    render json: @user.destroy!
  end

  def favourite_destination
    airport_visits = @user.trips.group(:airport_to).count
    render json: airport_visits.max_by{|airport, visits| visits}
  end

private 
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require([:time_in, :time_out, :password, :email])
    params.permit(:name, :second_name, :password, :phone, :email)
  end

end
