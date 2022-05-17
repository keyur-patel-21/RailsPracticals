require 'test_helper'
require "myproduct"

class TestProductTest < ActiveSupport::TestCase
  def setup
    @user = Myuser.new(email: "keyur@gmail.com",role: "admin",password: "password")
    @user.save
    @product = TestProduct.new(product_name: "abc", price: "600", description: "abcdefgh", myuser_id: @user.id)
  end

  test "product should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.product_name = ""
    assert_not @product.valid?
  end

  test "name should be unique" do
    @product.save
    @product2 = TestProduct.new(product_name: "abc", price: "600", description: "abcdefgh", myuser_id: @user.id)
    assert_not @product2.valid?
  end

  test "name should not be too long" do
    @product.product_name = "a" * 26
    assert_not @product.valid?
  end

  test "name should not be too short" do
    @product.product_name = "aa"
    assert_not @product.valid?
  end
  
  test "price should be present" do
    @product.price = ""
    assert_not @product.valid?
  end

  test "myuser_id should be present" do
    @product.myuser_id = ""
    assert_not @product.valid?
  end

end
