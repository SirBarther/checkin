class HomesController < ApplicationController
  def index
  	@locations = Location.all
  end
end
