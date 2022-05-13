class JusersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy] 

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
    if @user.update(user_params)
      redirect_to juser_path
    else
      render "edit"
    end
  end
  
  def show 
  end
  
  def destroy
    if @user.destroy
      redirect_to jusers_path
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
