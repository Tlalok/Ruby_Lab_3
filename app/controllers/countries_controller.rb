class CountriesController < ApplicationController

  before_action :set_country, only: [:show, :update, :destroy]

  def index
    render json: Country.all
  end

  def show
    render json: @country
  end

  def create
    country = Country.create!(country_params)
    render json: country
  end

  def update
    @country.update!(country_params)
    head :ok
  end

  def destroy
    render json: @country.destroy!
  end

private 

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:name)
    params.permit(:name)
  end

end
