class OrdernsController < ApplicationController

  before_action :set_ordern, only: [:show, :edit, :update, :destroy]
  
  def index
    @orderns = Ordern.all
  end
  
  def new
    @productn = Productn.find(params[:productn_id])
    @ordern = Ordern.new
  end
  
  def create
    @productn = Productn.find(params[:productn_id])
    @ordern = Ordern.create(ordern_params)
    if @ordern.save
      redirect_to productn_path(@productn)
    else
      render "new"
    end
  end
  
  def edit
    @productn = Productn.find(params[:productn_id])
  end
  
  def update
    @productn = Productn.find(params[:productn_id])
    if @ordern.update(ordern_params)
      redirect_to productn_path(@productn)
    else
      render "edit"
    end
  end

  def show
  end
  
  def destroy
    @productn = Productn.find(params[:productn_id])
    if @ordern.destroy
      redirect_to productn_path(@productn)
    end
  end

  private

  def set_ordern
    @ordern = Ordern.find(params[:id])
  end

  def ordern_params
    params.require(:ordern).permit(:productn_id, :quantity)
  end
end
