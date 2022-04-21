class Business::CustomernsController < ApplicationController

  before_action :set_customern, only: [:edit, :update]
  
  def index
    @customerns = Customern.all
  end
  
  def create
    @customern = Customern.create(customern_params)
    if @customern.save
      redirect_to business_customerns_path
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @customern.update(customern_params)
      redirect_to business_customerns_path	
    else
      render "edit"
    end
  end

  # method to preview the customer
  def preview
    @customern = Customern.find(params[:id])
  end

  # methof to delete cusotmer
  def delete_customer 
    @customern = Customern.find(params[:id])
    if @customern.destroy
      redirect_to business_customerns_path
    end
  end

  # method to search for customer in list
  def search
    if params[:search].blank?
      redirect_to business_customerns_path
    else
      @parameter = params[:search.downcase]
      @customerns = Customern.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end

  private

  def set_customern
    @customern = Customern.find(params[:id])
  end

  def customern_params
    params.require(:customern).permit(:name)
  end
end
