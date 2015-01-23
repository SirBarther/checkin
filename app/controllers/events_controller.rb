class EventsController < ApplicationController

	def create
		@event = Event.new(event_params)
		@location = Location.find_by(id: params[:location_id])
		@event.location_id = @location.id
		if Student.exists?(tag: @event.student_tag)
			if @event.save
				flash[:notice] = "You have checked in"
				redirect_to :back
			else
				flash[:notice] = "Please try again"
				render "locations/show"
			end
		else
			flash[:notice] = "The provided ID doesn't exist or is blank. Please register"
			redirect_to :back
		end
	end

	private

	def event_params
		params.require(:event).permit(:student_tag)
	end
end

