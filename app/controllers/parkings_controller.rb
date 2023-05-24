class ParkingsController < ApplicationController
  def index
    @user = User.all
		@parkings = Parking.all
    @parking_types = ParkingType.all
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy 
  end

  def show 
  end
end
