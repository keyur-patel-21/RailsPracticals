class MyuserController < ApplicationController
  include Devise::Controllers::Helpers

  def home
    if current_myuser and current_myuser.role == "admin"
      render "layouts/admin"
    elsif current_myuser and current_myuser.role == "merchant"
      render "layouts/merchant"
    end
  end
end
