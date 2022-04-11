class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy] 
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to events_path
    else
      render "new"
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Acconut and all associated events has been deleted succesfully"
    redirect_to events_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render "edit"
    end
  end

  def show
    @events = @user.events
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can Only edit your own Account"
      redirect_to @user
    end
  end
end