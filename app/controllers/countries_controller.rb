class CountriesController < ApplicationController

  def index
    render json: Country.all
  end

  def show
    country_id = params[:id]
    render json: Country.find(country_id)
  end

  def create
    country = Country.new
    country.name = params[:name]
    country.save
    render json: country
  end

end
