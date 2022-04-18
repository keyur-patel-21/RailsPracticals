class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy] 
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.build_address 
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

  def enroll
    @user = User.find_by(id: session[:user_id])
    if session[:user_id] && params[:event_id]
      Enrollment.create(user_id:session[:user_id],event_id:params[:event_id])
      redirect_to events_path
    end
  end

  def unenroll
    enrollment = Enrollment.find_by("user_id=? and event_id=?",current_user,params[:event_id])
    enrollment.destroy

    redirect_to events_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, address_attributes: [:user_address])
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
