class EmployeensController < ApplicationController
  
  before_action :set_employeen, only: [:show, :edit, :update, :destroy]
  
  def index
    @employeens = Employeen.all
  end
  
  def new
    @employeen = Employeen.new
    2.times { @employeen.eaddresses.build }
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
      redirect_to employeens_path
    end
  end

  # method to search for Employee in list
  def searched
    if params[:search].blank?
      redirect_to employeens_path
    else
      @parameter = params[:search.downcase]
      @employeens = Employeen.all.where("lower(employee_name) LIKE :search", search: "%#{@parameter}%")
    end
  end

  private

  def set_employeen
    @employeen = Employeen.find(params[:id])
  end

  def employeen_params
    params.require(:employeen).permit(:employee_name, :email, :password, :gender, {hobbies:[]}, :address, :mobile_number, :birth_date, :document, eaddresses_attributes: [:house_name, :street_name, :road])
  end
end
