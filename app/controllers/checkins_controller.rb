class CheckinsController < ApplicationController

	def create
		@checkin = Checkin.new
	end

end