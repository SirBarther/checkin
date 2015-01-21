class LocationsController < ApplicationController
  def index
  	@location = Location.find(params[:id])
  end

  def create
    authenticate_user!
  end

  def update
    authenticate_user!
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
