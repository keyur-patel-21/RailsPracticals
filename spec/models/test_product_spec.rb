require 'rails_helper'

RSpec.describe TestProduct, type: :model do
  
  before do
    @user = Myuser.new(email: "keyur@gmail.com",role: "admin",password: "password")
    @user.save
    @product = TestProduct.new(product_name: "productxyz", price: "600", description: "adhdahah", myuser_id: @user.id)
    @product.save
  end
  
  it "is valid with valid attributes" do
    expect(@product).to be_valid
  end

  it "is not valid without a product_name" do
    @product.product_name = ""
    expect(@product).to_not be_valid
  end

  it "is not valid without a price" do
    @product.price = ""
    expect(@product).to_not be_valid
  end
  
  it "is not valid without a myuser id" do
    @product.myuser_id = ""
    expect(@product).to_not be_valid
  end
end
