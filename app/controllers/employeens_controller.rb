class EmployeensController < ApplicationController
  
  before_action :set_employeen, only: [:show, :edit, :update, :destroy]
  
  def index
    @employeens = Employeen.all
  end
  
  def new
    @employeen = Employeen.new
  end
  
  def create
    @employeen = Employeen.create(employeen_params)
    if @employeen.save
      redirect_to employeens_path
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @employeen.update(employeen_params)
      redirect_to employeen_path(@employeen)
    else
      render "edit"
    end
  end

  def show
  end
  
  def destroy
    if @employeen.destroy
      redirect_to employeen_path
    end
  end

  private

  def set_employeen
    @employeen = Employeen.find(params[:id])
  end

  def employeen_params
    params.require(:employeen).permit(:employee_name, :email, :password, :gender, :hobbies, :address, :mobile_number, :birth_date, :document)
  end
end
