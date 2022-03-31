class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    @temp = order_params[:product_id]
    @product_price = product.find(@temp)
    @order.total_price = @product_price.price * @order.quantity
    if @order.save
      flash[:notice] = "Order Saved Successfully"
      redirect_to  order_path(@order)
    else
      render "new"
    end
  end
  
  def edit
    set_product
  end
  
  def update
    set_product
    if @order.update(order_params)
      flash[:notice] = "Order updates Successfully"
      redirect_to  order_path(@order)
    else
      render "edit"
    end
  end
  
  def show
    set_product
  end
  
  def destroy
    set_product
    if @order.destroy
      redirect_to orders_path
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:quantity, :total_price, :status, :product_id,:customer_id)
  end
end
