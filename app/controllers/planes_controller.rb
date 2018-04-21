class PlanesController < ApplicationController

	def index
    render json: Plane.all
  end

  def show
    plane_id = params[:id]
    render json: Plane.find(plane_id)
  end

  def create
    plane = Plane.new
    plane.name = params[:name]
    plane.place_count = params[:place_count]
    plane.save
    render json: plane
  end
  
end
