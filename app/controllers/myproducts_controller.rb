class MyproductsController < ApplicationController

  before_action :set_myproduct, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:show, :index]
  
  def index
    @myproducts = Myproduct.all
  end
  
  def new
    @myproduct = Myproduct.new
  end
  
  def create
    @myproduct = Myproduct.create(myproduct_params)
    if @myproduct.save
      redirect_to myproducts_path
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @myproduct.update(myproduct_params)
      redirect_to myproduct_path(@myproduct)
    else
      render "edit"
    end
  end

  def show
  end
  
  def destroy
    if @myproduct.destroy
      redirect_to myproducts_path
    end
  end

  private

  def set_myproduct
    @myproduct = Myproduct.find(params[:id])
  end

  def myproduct_params
    params.require(:myproduct).permit(:name, :rate)
  end

  def require_admin
    if current_myuser.role != "admin"
      flash[:alert] = "You must be logged in to perform that action"
    end
  end
end
