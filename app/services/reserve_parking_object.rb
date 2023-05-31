class ReserveParkingObject
	def initialize(booking_params, user_id)
		@reserve_date = booking_params[:reserve_date]
		@duration = booking_params[:duration]
		@car = booking_params[:car]
		@booking_time = booking_params[:booking_time]
		@parking_id = booking_params[:address_filter].to_i
		@user_id = user_id.to_i
		@credit_car_number = booking_params[:method_pay]
	end

	def create_booking
		finish_hour = set_hours_parking(@duration, @booking_time).to_date
		client_car_id = return_client_car_id(@car, @user_id)
		client_credit_card_id = return_client_credit_card_id(@credit_car_number, @user_id)
		user_id = return_client_id(@user_id)
		parking_id = return_parking_id(@parking_id.to_i)
		start_hour = return_start_hour(@reserve_date).to_date
		booking = Booking.new(user_id: user_id, parking_id: @parking_id, status: false, start_hour: start_hour, finish_hour: finish_hour, date: start_hour, client_car_id: client_car_id, creditcard_id: client_credit_card_id)
		if validate_available_spaces(booking)
			if booking.save
				rest_spaces_available_parkign(booking)
				return true
			else
				return false
			end
		else
			return false 
		end
	end

	private

	def validate_available_spaces(booking) 
		if booking.parking.spaces_available > 1
			true 
		else
			false
		end
	end

	def rest_spaces_available_parkign(booking)
		spaces_available = booking.parking.spaces_available - 1
		if booking.parking.update(spaces_available: spaces_available)
			true 
		else
			false 
		end
	end

	def set_hours_parking(duration, booking_time)
		start_hour = booking_time
		finish_hour = DateTime.current.advance(minutes: duration.to_i)
		return finish_hour
	end

	def return_client_car_id(car, user_id)
		ClientCar.where(user_id: user_id, plate: car).last.id
	end

	def return_client_credit_card_id(number_credit, user_id)
		Creditcard.where(user_id: user_id, number_card: number_credit).last.id
	end

	def return_client_id(user_id)
		User.find(user_id).id
	end

	def return_parking_id(parking_id)
		Parking.find(parking_id)
	end

	def return_start_hour(start_hour)
		start_hour.to_date
	end
end