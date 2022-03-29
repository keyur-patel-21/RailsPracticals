class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params.require(:product).permit(:title, :description, :price, :capacity, :is_active, :status))
    if @product.save
      flash[:notice] = "Product was created Successfully"
      redirect_to product_path(@product)
    else
      render "new"
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product = Product.new(params.require(:product).permit(:title, :description, :price, :capacity, :is_active, :status))
      flash[:notice] = "Product was updated Successfully"
      redirect_to product_path
    else
      render "edit"
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path
    end 
  end
end
