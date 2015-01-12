class LocationsController < ApplicationController
  def index
  end

  def create
  	@location = Location.new
  end

  def show
  	@location = Location.find(params[:id])
  end

end
