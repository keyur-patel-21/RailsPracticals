class AuthorsController < ApplicationController

	def index
		@authors = Author.all
	end

  def show
    @author = Author.find(params[:id])
  end

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(params.require(:author).permit(:first_name, :last_name, :dob, :email))
		if @author.save
			flash[:notice] = "Author was created successfully"
			redirect_to @author
		else
			render "new"
		end
	end

	def edit
		@author = Author.find(params[:id])

	end

	def update
		@author = Author.find(params[:id])
		if @author.update(params.require(:author).permit(:first_name, :last_name, :dob, :email))
			flash[:notice] = "Author was updated Successfully."
			redirect_to @author
		else
			render "edit"
		end
	end

	def destroy
		@author = Author.find(params[:id])
		if @author.destroy
			redirect_to authors_path
		end
	end
end
