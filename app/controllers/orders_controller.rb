class OrdersController < ApplicationController

  def index
    if params[:search]
      @orders = Order.all
      @orders = Order.where(status:'Booked') if params[:search] == 'Booked'
      @orders = Order.where(status:'Cancelled') if params[:search] == 'Cancelled'
    else
      @orders = Order.all
    end

  
    if params[:product_name]
      if @product = Product.find_by(title: params[:product_name])
        @view_orders = @product.orders
      else
        @view_orders = nil
      end
    end
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order Saved Successfully"
      redirect_to order_path(@order)
    else
      render "new"
    end
  end
  
  def edit
    set_order
  end
  
  def update
    set_order
    if @order.update(order_params)
      flash[:notice] = "Order updates Successfully"
      redirect_to  order_path(@order)
    else
      render "edit"
    end
  end
  
  def show
    set_order
  end
  
  def destroy
    set_order
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
