class Business::CustomernsController < ApplicationController

  before_action :set_customern, only: [:edit, :update]
	
	def index
    @customerns = Customern.all
	end
	
	def create
		@customern = Customern.create(customern_params)
    if @customern.save
			redirect_to business_customerns_path
		else
			render "new"
		end
	end
	
	def edit
	end
	
	def update
		if @customern.update(customern_params)
			redirect_to business_customerns_path	
		else
			render "edit"
		end
	end

	def preview
		@customern = Customern.find(params[:id])
	end

	def delete_customer 
		@customern = Customern.find(params[:id])
    if @customern.destroy
      redirect_to customers_path
    end
	end

	def search
		@customern=Customern.where('name?',params[:search]) if params[:search]
	end

	private

	def set_customern
		@customern = Customern.find(params[:id])
	end

	def customern_params
		params.require(:customern).permit(:name)
	end
end
