class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(params.require(:order).permit(:quantity, :total_price, :product_id, :status, :customer_id))
    if @order.save
      flash[:notice] = "Order Saved Successfully"
      redirect_to  order_path(@order)
    else
      render "new"
    end
  end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(params.require(:order).permit(:quantity, :total_price, :product_id, :status, :customer_id))
      flash[:notice] = "Order updates Successfully"
      redirect_to  order_path(@order)
    else
      render "edit"
    end
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_path
    end
  end
end
