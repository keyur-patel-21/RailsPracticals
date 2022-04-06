class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    search()
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

  def results
  end

  def search
    if params[:q]
      if Employee.find_by("email = ?",params[:q])
        flash.now[:notice] = "Entered Email Does  Exist."
      else
        flash.now[:notice] = "Entered Email Does not Exist."
      end    
    end  
  end
  
  def increaseOrder
    @temp = Employee.find_in_batches(batch_size: 10)
    @temp.first.each do |e|
      e.no_of_order += 1
      e.save
    end
    redirect_to employees_path(@employee)
  end
  
  def decreaseOrder
    @temp = Employee.find_in_batches(batch_size: 10) 
    @temp.first.each do |e|
      e.no_of_order -= 1
      e.save
    end
    redirect_to employees_path(@employee)
  end
end
