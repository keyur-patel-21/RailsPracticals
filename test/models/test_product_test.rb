require 'test_helper'
require "myproduct"

class TestProductTest < ActiveSupport::TestCase
  def setup
    @user = Myuser.new(email: "keyur@gmail.com",role: "admin",password: "password")
    @user.save
    @product = TestProduct.new(product_name: "abc", price: "600", description: "abcdefgh", myuser_id: @user.id)
  end

  test "attributes should be valid" do
    assert @product.valid?
  end

  test "should not save without name" do
    @product.product_name = ""
    assert_not @product.valid?
  end
  
  test "should not save without price" do
    @product.price = ""
    assert_not @product.valid?
  end

  test "should not save without myuser_id" do
    @product.myuser_id = ""
    assert_not @product.valid?
  end

end
