class WelcomePageController < ApplicationController
	def index
		@user = User.all
		@parkings = Parking.all
	end
end
