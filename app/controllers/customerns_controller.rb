class CustomernsController < ApplicationController

  before_action :set_customern, only: [:edit]
	
	def index
    @customerns = Customern.all
	end
	
	def create
		@customern = Customern.create(customern_params)
    if @customern.save
			redirect_to customerns_path
		else
			render "new"
		end
	end
	
	def edit
	end
	
	def update
		if @customern.update(customern_params)
			redirect_to customern_path(@customern)
		else
			render "edit"
		end
	end


	
	def destroy
		if @customern.destroy
			redirect_to customerns_path
		end
	end

	private

	def set_customern
		@customern = Customern.find(params[:id])
	end

	def customern_params
		params.require(:customern).permit(:name)
	end
end
