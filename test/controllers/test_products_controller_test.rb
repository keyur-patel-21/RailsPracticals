require 'test_helper'

class TestProductsControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in myusers(:one)
    @product = test_products(:one)
  end
  setup do
    @user = Myuser.new(email: "keyur@gmail.in",role: "admin",password: "password")
    @user.save
    @product = @user.test_products.new(product_name: "computer", description: "abc desc", price: "600", myuser_id: @user.id)
    @product.save
  end

  test "should get index" do
    get test_products_path
    assert_response :success
  end

  test "should get new" do
    get new_test_product_path
    assert_response :success
  end

  test "should create product" do
    assert_difference('TestProduct.count') do
      post test_products_path, params: { test_product: {product_name: "Keyboard", description: "abc desc", price: "600", myuser_id: @user.id }}
    end
    assert_redirected_to test_products_path 
  end

  test "should show product" do
    get test_product_path(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_product_path(@product)
    assert_response :success
  end

  test "should update product" do
    @product.update(:product_name => "Mouse")
    
    assert TestProduct.find_by(product_name: 'Mouse')
    assert_equal "Mouse", @product.product_name
  end

  test "should get delete" do
    delete test_product_path(@product)
    assert_nil(TestProduct.find_by(product_name:"computer"))
  end
end
