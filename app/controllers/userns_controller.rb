class UsernsController < ApplicationController

  before_action :set_usern, only: [:show, :edit, :update, :destroy]
  
  def index
    @userns = Usern.all
  end
  
  def new
    @usern = Usern.new
  end
  
  def create
    @usern = Usern.create(usern_params)
    if @usern.save
      UsernMailer.with(user: @usern).welcome_email.deliver_later
      redirect_to userns_path
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @usern.update(usern_params)
      redirect_to usern_path(@usern)
    else
      render "edit"
    end
  end

  def show
  end
  
  def destroy
    if @usern.destroy
      redirect_to usern_path
    end
  end

  private

  def set_usern
    @usern = Usern.find(params[:id])
  end

  def usern_params
    params.require(:usern).permit(:name, :email, :picture)
  end
end
