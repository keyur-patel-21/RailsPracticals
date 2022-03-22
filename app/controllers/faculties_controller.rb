class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all
  end
  
  def new
    @faculty = Faculty.new
  end
  
  def create
    @faculty = Faculty.new(params.require(:faculty).permit(:f_firstname, :f_lastname, :f_phone, :f_email, :f_dob, :f_designation))
    if @faculty.save
      flash[:notice] = "Faculty was created successfully"
      redirect_to @faculty
    else
      render "new"
    end
  end
  
  def edit
    @faculty = Faculty.find(params[:id])
  end
  
  def update
    @faculty = Faculty.find(params[:id])
    if @faculty = Faculty.update(params.require(:faculty).permit(:f_firstname, :f_lastname, :f_phone, :f_email, :f_dob, :f_designation))
      flash[:notice] = "Faculty was updated Successfully."
      redirect_to @faculty
    else
      render "edit"
    end
  end
  
  def show
    @faculty = Faculty.find(params[:id])
  end
  
  def destroy
    @faculty = Faculty.find(params[:id])
    if @faculty.destroy
      redirect_to faculties_path
    end  
  end
end
