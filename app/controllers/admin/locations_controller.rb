module Admin
  class LocationsController < ApplicationController
    def index
    	@locations = Location.all
    end

    def create
      authenticate_user!
    	@new_location = Location.new(location_params)
      if current_user
        if @new_location.save
          flash[:notice] = "You have successfully created a new location"
          redirect_to root_path
        else
          flash[:notice] = "There was a problem saving your location"
          render "admin/locations/new"
        end
      else
        flash[:notice] = "You must be signed in to create a new location"
        render "/"
      end
    end

    def show
      @students = []
    	@location = Location.find(params[:id])
    	@event = Event.new
      @tag = self.try(:tag)
    end

    def new
      @new_location = Location.new
    end

    private

    def location_params
      params.require(:location).
      permit(
        :name,
        :city,
        :state,
        :country
        ) 
    end
  end
end
