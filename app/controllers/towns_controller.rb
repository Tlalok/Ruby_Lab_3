class TownsController < ApplicationController

	def index
    render json: Town.all
  end

  def show
    town_id = params[:id]
    render json: Town.find(town_id)
  end

  def create
    town = Town.new
    town.name = params[:name]
    town.country_id = params[:country_id]
    town.save
    render json: town
  end

end
