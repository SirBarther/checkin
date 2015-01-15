class LocationsController < ApplicationController
  def index
  	@location = Location.find(params[:id])
  end

  def create
    authenticate_user!
  	@location = Location.new
    if current_user
      @location = Location.new
      if @location.save
        flash[:notice] = "You have successfully created a new location"
        redirect_to "locations/show"
      else
        flash[:notice] = "There was a problem saving your location"
        render "locations/new"
      end
    else
      flash[:notice] = "You must be signed in to create a new location"
      render "locations/new"
    end
  end

  def show
    @students = []
  	@location = Location.find(params[:id])
  	@event = Event.new
    @tag = self.try(:tag)
  end

  def new
    authenticate_user!
  end
  
end
