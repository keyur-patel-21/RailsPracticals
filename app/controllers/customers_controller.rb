class CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end
  
  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(params.require(:customer).permit(:firstname, :lastname, :email, :phone))
    if @customer.save
      flash[:notice] = "Customer Saved Successfully"
      redirect_to  customer_path(@customer)
    else
      render "new"
    end
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer = Customer.update(params.require(:customer).permit(:firstname, :lastname, :email, :phone)) 
      flash[:notice] = "Customer was updated Successfully"
      redirect_to customer_path
    else
      render "edit"
    end
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy
      redirect_to customer_path
    end
  end
end
