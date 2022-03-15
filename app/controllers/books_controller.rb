class BooksController < ApplicationController

	def index
		@books = Book.all
	end

  def show
    @book = Book.find(params[:id])
  end

	def new
		@book = Book.new
	end

	def create
		@book = Book.create(params.require(:book).permit(:name, :price, :author_id))
		if @book.save
			flash[:notice] = "Book was created successfully"
			redirect_to books_path
		else
			render "new"
		end
	end

	def edit
		@book = Book.find(params[:id])

	end

	def update
		@book = Book.find(params[:id])
		if @book.update(params.require(:book).permit(:name, :price, :author_id))
			flash[:notice] = "Book was updated Successfully."
			redirect_to @book
		else
			render "edit"
		end
	end

	def destroy
		@book = Book.find(params[:id])
		if @book.destroy
			redirect_to books_path
		end
	end
end