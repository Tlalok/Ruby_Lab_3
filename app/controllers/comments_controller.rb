class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_commentable, only: [:index, :create]

  def index
    render json: @commentable.comments
  end

  def show
    render json: @comment
  end

  def create
    comment = Comment.create!(commentable: @commentable, body: params[:text])
    render json: comment
  end

  def update
    @comment.update!(body: params[:text])
    head :ok
  end

  def destroy
    render json: @comment.destroy!
  end

private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_commentable
    if(params.has_key?(:country_id))
      @commentable = Country.find(params[:country_id])
    elsif(params.has_key?(:town_id))
      @commentable = Town.find(params[:town_id])
    end
  end

end
