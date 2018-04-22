class TownsController < ApplicationController

  before_action :set_town, only: [:show, :update, :destroy]

  def index
    render json: Town.all
  end

  def show
    render json: @town
  end

  def create
    town = Town.create!(town_params)
    render json: town
  end

  def update
    @town.update!(town_params)
    head :ok
  end

  def destroy
    render json: @town.destroy!
  end

private 

  def set_town
    @town = Town.find(params[:id])
  end

  def town_params
    params.require([:name, :country_id])
    params.permit(:name, :country_id)
  end

end
