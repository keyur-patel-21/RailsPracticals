class ProductnsController < ApplicationController
  
  before_action :set_productn, only: [:show, :edit, :update, :destroy]
	
	def index
    @productns = Productn.all
	end
	
	def new
		@productn = Productn.new
	end
	
	def create
		@productn = Productn.create(productn_params)
    if @productn.save
			redirect_to productns_path
		else
			render "new"
		end
	end
	
	def edit
	end
	
	def update
		if @productn.update(productn_params)
			redirect_to productn_path(@productn)
		else
			render "edit"
		end
	end

	def show
	end
	
	def destroy
		if @productn.destroy
			redirect_to productns_path
		end
	end

	private

	def set_productn
		@productn = Productn.find(params[:id])
	end

	def productn_params
		params.require(:productn).permit(:name, :rate)
	end
end
