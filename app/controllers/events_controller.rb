class EventsController < ApplicationController
	
	def index
		@events = Event.all	
	end
	
	def new
		@event = Event.new
	end
	
	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to event_path(@event)
		else
			render "new"
		end
	end
	
	def edit
		set_event
	end
	
	def update
		set_event
		if @event.update(event_params)
			redirect_to event_path(@event)
		else
			render "edit"
		end
	end

	def show
		set_event
	end
	
	def destroy
		set_event
		if @event.destroy
			redirect_to events_path
		end
	end

	private

	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :description, :event_date)
	end
end
