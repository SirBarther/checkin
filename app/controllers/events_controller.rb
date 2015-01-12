class EventsController < ApplicationController

	def create
		#binding.pry
		@event = Event.new(event_params)
		@location = Location.find(params[:location_id])
		#@event.location_id = params(location_id)
		if @event.save
			flash[:notice] = "You have checked in"
		else
			flash[:notice] = "Please try again"
		end		
		redirect_to location_path(@location)
	end

	private

	def event_params
		params.require(:event).permit(:tag_id)
	end
end