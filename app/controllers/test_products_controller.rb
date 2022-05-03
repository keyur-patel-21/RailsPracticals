class TestProductsController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy] 

  def index
    @products = TestProduct.all
  end
  
  def new
    @product = TestProduct.new
  end
  
  def create
    @product = TestProduct.new(product_params)
    if @product.save
      redirect_to test_products_path
    else
      render "new"
    end
  end
  
  def edit  
  end
  
  def update
    if @product.update(product_params)
      redirect_to test_product_path
    else
      render "edit"
    end
  end
  
  def show
  end
  
  def destroy
    if @product.destroy
      redirect_to test_products_path
    end
  end

  private

  def product_params
    params.require(:test_product).permit(:product_name, :price, :description)
  end

  def set_product
    @product = TestProduct.find(params[:id])
  end
end
