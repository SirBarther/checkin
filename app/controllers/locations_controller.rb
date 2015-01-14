class LocationsController < ApplicationController
  def index
  	@location = Location.find(params[:id])
  end

  def create
  	@location = Location.new
  end

  def show
    @students = []
  	@location = Location.find(params[:id])
  	@event = Event.new
    @tag = self.try(:tag)
  end

end
