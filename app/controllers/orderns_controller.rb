class OrdernsController < ApplicationController

  before_action :set_ordern, only: [:show, :edit, :update, :destroy]
	
	def index
    @orderns = Ordern.all
	end
	
	def new
		@ordern = Ordern.new
	end
	
	def create
		@ordern = Ordern.create(ordern_params)
    if @ordern.save
			redirect_to productn_path(@ordern)
		else
			render "new"
		end
	end
	
	def edit
	end
	
	def update
		if @ordern.update(ordern_params)
			redirect_to productn_path(@ordern)
		else
			render "edit"
		end
	end

	def show
	end
	
	def destroy
		if @ordern.destroy
			redirect_to orderns_path
		end
	end

	private

	def set_ordern
		@ordern = Ordern.find(params[:id])
	end

	def ordern_params
		params.require(:ordern).permit(:product_id, :quantity)
	end
end
