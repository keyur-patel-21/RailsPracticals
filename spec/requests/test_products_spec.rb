require 'rails_helper'

RSpec.describe "TestProducts", type: :request do
  include Devise::Test::IntegrationHelpers
 
  setup do
    @user = Myuser.new(email: "keyur@gmail.com",role: "admin",password: "password")
    sign_in @user
  end

  it "get index path" do
    get test_products_path
    expect(response).to have_http_status(200)
  end

  it "get new path" do
    get new_test_product_path
    expect(response).to be_successful
  end
end
