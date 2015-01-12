class LocationsController < ApplicationController
  def index
  	@location = Location.find(params[:id])
  end

  def create
  	@location = Location.new
  end

  def show
  	@location = Location.find(params[:id])
  	@event = Event.new
  end

end
