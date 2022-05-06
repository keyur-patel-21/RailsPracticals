require 'test_helper'
require "myuser"

class MyuserTest < ActiveSupport::TestCase
  def setup
    @user = Myuser.new(email: "keyur@gmail.com",role: "admin",password: "password")
  end

  test "attributes should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "password should be present" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "role should be present" do
    @user.role = ""
    assert_not @user.valid?
  end
end
