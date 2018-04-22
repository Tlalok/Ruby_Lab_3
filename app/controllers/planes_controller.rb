class PlanesController < ApplicationController

  before_action :set_plane, only: [:show, :update, :destroy]

  def index
    render json: Plane.all
  end

  def show
    render json: @plane
  end

  def create
    plane = Plane.create!(plane_params)
    render json: plane
  end

  def update
    @plane.update!(plane_params)
    head :ok
  end

  def destroy
    render json: @plane.destroy!
  end

private 

  def set_plane
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require([:name, :place_count])
    params.permit(:name, :place_count)
  end
  
end
