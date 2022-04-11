class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_action :require_user, except: [:show, :index]
	before_action :require_same_user, only: [:edit, :update, :destroy]
	
	def index
		if params[:filter]
      @events = Event.all
      @events = Event.where(category:'Music') if params[:search] == 'Music'
      @events = Event.where(category:'Visual Arts') if params[:search] == 'Visual Arts'
      @events = Event.where(category:'Film') if params[:search] == 'Film'
      @events = Event.where(category:'Fashion') if params[:search] == 'Fashion'
    else
      @events = Event.all
    end	
	end
	
	def new
		@event = Event.new
	end
	
	def create
		@event = Event.new(event_params)
		@event.user = current_user
		if @event.save
			redirect_to event_path(@event)
		else
			render "new"
		end
	end
	
	def edit
	end
	
	def update
		if @event.update(event_params)
			redirect_to event_path(@event)
		else
			render "edit"
		end
	end

	def show
	end
	
	def destroy
		if @event.destroy
			redirect_to events_path
		end
	end

	private

	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :description, :event_date, :user_id)
	end

	def require_same_user
		if current_user !=  @event.user
			flash[:alert] = "You can only edit or delete your own event"
			redirect_to @event
		end
	end
end
