class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(params.require(:student).permit(:s_firstname, :s_lastname,:s_dob, :s_department, :s_terms))
    @student.s_department = (params.require(:student).permit(:s_firstname, :s_lastname,:s_dob, :s_department, :s_terms))[:s_department].upcase
    if @student.save  
      flash[:notice] = "Student was created successfully"
      redirect_to @student
    else
      render "new"
    end
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(params.require(:student).permit(:s_firstname, :s_lastname, :s_dob, :s_department, :s_terms))
      flash[:notice] = "Student was updated Successfully."
      redirect_to @student
    else
      render "edit"
    end
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      redirect_to students_path
    end
  end
end
