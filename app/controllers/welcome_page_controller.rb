class WelcomePageController < ApplicationController
	def index
		@user = User.all
	end
end
