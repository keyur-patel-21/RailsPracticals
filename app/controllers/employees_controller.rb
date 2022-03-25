class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end
  
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.find_or_initialize_by(params.require(:employee).permit(:firstname, :lastname, :email, :age, :no_of_order, :full_time_available, :salary))
    if @employee.save
      flash[:notice] = "Employee was created Successfully"
      redirect_to employee_path(@employee)
    else
      render "new"
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    if @employee.update(params.require(:employee).permit(:firstname, :lastname, :email, :age, :no_of_order, :full_time_available, :salary))
      flash[:notice] = "Employee was updated Successfully."
      redirect_to employee_path
    else
      render "edit"
    end
  end
  
  def show
    @employee = Employee.find(params[:id])
  end
  
  def destroy
    @employee = Employee.find(params[:id])
    if @employee.destroy
      redirect_to employees_path
    end
  end

  def search
    @employees = Employee.search_email_display_all(params[:search])
  end

  def results
    
  end
end
