class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def edit
    set_product
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      flash[:notice] = "Product was created Successfully"
      redirect_to product_path(@product)
    else
      render "new"
    end
  end
  
  def update
    set_product
    if @product.update(product_params)
      flash[:notice] = "Product was updated Successfully"
      redirect_to product_path
    else
      render "edit"
    end
  end
  
  def show
    set_product
  end
  
  def destroy
    set_product
    if @product.destroy
      redirect_to products_path
    end 
  end

  # def display_all_products
  #   @products=Product.all.unscoped
  # end

  # def display_products_which_is_active
  #   @products=Product.all
  # end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :price, :capacity,:is_active, :status)
    end

end
