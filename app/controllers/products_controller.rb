class ProductsController < ApplicationController
  
  def index
    @products = Product.all.unscoped
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
      if @product.is_active = "Yes"
        redirect_to product_path(@product)
      else
        redirect_to products_path
      end
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

  def activeTrue
    @products=Product.all
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :price, :capacity,:is_active, :status)
    end

end
