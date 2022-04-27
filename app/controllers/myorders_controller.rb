class MyordersController < ApplicationController

  before_action :set_myorder, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_myuser!
  
  def index
    @myorders = Myorder.all
  end
  
  def new
    @myorder = Myorder.new
  end
  
  def create
    @myorder = Myorder.create(myorder_params)
    if @myorder.save
      redirect_to myorders_path
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @myorder.update(myorder_params)
      redirect_to myorder_path(@myorder)
    else
      render "edit"
    end
  end

  def show
  end
  
  def destroy
    if @myorder.destroy
      redirect_to myorders_path
    end
  end

  private

  def set_myorder
    @myorder = Myorder.find(params[:id])
  end

  def myorder_params
    params.require(:myorder).permit(:myproduct_id, :quanity)
  end
end
