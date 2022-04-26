class Api::V1::ArticlesController < ApplicationController 

  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def index
    @acomments = Acomment.all
    render json: @acomments
  end

  def new
    @acomment = Acomment.new
    render json: @acomment
  end

  def create
    @acomment = Acomment.create(acomment_params)
    if @acomment.save
      render json: @acomment
    else
      render json: "Something went terrible wrong"
    end
  end

  def edit
    render json: @acomment
  end

  def update
    if @acomment.update(acomment_params)
      render json: "Successfully updated"
    else
      render json: "Somthing went Wrong"
    end
  end

  def show
    render json: @acomment
  end

  def destroy
    if @acomment.destroy
      render json: "Successfully deleted"
    end
  end

  private

  def set_acomment
    @acomment = Acomment.find(params[:id])
  end

  def acomment_params
    params.require(:acomment).permit(:comment, :date_of_comment, :article_id)
  end

end

