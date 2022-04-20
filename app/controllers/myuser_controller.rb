class MyuserController < ApplicationController
  include Devise::Controllers::Helpers

  def home
    if current_myuser and current_myuser.role == "admin"
      render "layout/admin"
    elsif current_myuser and current_myuser.role == "merchant"
      render "layout/merchant"
    end
  end
end
