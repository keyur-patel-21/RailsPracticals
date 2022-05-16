class JusersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy, :profile, :changepassword] 

  def index
    @users = Juser.all
  end
  
  def new
    @user = Juser.new
  end
  
  def create
    # binding.pry
    @user = Juser.new(user_params)
    if @user.save
      redirect_to jusers_path
    else
      render "new"
    end
  end
  
  def edit    
  end
  
  def update
    @user = Juser.find(params[:id])
    binding.pry
    respond_to do |format|
      if @user.update(user_params)
        flash[:notice] = "User Updated Successfully"
      else
        flash[:errors] = @user.errors.full_messages
      end
      format.js
    end
  end
  
  def show 
  end
  
  def destroy
    if @user.destroy
      redirect_to jusers_path
    end
  end

  # method for profile page
  def profile
  end

  # method for change password
  def changepassword
  end

  def changepassword_update
    @user = Juser.find(params[:id])
    binding.pry
    if @user.update_attribute(:password, params[:new_password])
      flash[:notice] = "Password updated successfully"
      redirect_to juser_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to changepassword_juser_path(@user)
    end
  end
  
  private

  def user_params
    params.require(:juser).permit(:first_name, :last_name, :email, :password, :subscription, :subscription_email)
  end

  def set_user
    @user = Juser.find(params[:id])
  end
end
