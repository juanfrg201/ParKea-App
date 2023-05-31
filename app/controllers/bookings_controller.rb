class BookingsController < ApplicationController
  def index
    @addresses = Parking.all
    @current_user_cars_id = current_user.client_cars.pluck(:plate)
    @pay_methods = current_user.creditcards.pluck(:number_card)
    @options = Parking.pluck(:address, :id)
  end

  def create
    reserve_parking_object = ReserveParkingObject.new(create_booking_params, current_user.id)
    if reserve_parking_object.create_booking    
      redirect_to reserve_index_bookings_path
      flash[:success] = "Se pudo reservar el parqueadero"
    else  
      redirect_to bookings_path
      flash[:error] = "No se pudo reservar el parqueadero, revise las fechas o no hay disponibilidad"
    end
  end

  def destroy
    begin
      @booking = Booking.find(params[:id])
      if !@booking.status 
        if @booking.destroy 
          flash[:success] = "Se elimino la reserva"
        else
          flash[:error] = "No se elimino la reserva"
        end
      else
        flash[:error] = "No se elimino la reserva"
      end  
    rescue Exception => e
      flash[:error] = "No se elimino la reserva, revisa si tiene dependencia"
    end
  end

  def enable
    @booking = Booking.find(params[:id])
    if @booking.update(status: true)
      redirect_to reserve_index_bookings_path
      flash[:success] = "Se marco ingreso del carro"
    else
      redirect_to reserve_index_bookings_path
      flash[:error] = "No se pudo marcar ingreso"
    end
  end

  def show 
    @booking = Booking.find(params[:id])
  end

  def reserve_index 
    @client_booking = Booking.where(user_id: current_user.id).all
  end

  def disable
    @booking = Booking.find(params[:id])
    if @booking.update(status: false)
      redirect_to reserve_index_bookings_path
      flash[:success] = "Se marco salida"
    else
      redirect_to reserve_index_bookings_path
      flash[:error] = "No se pudo desmarcar ingreso"
    end
  end

  def new
    @booking = Booking.new
  end

  private 

  def create_booking_params 
    params.require(:booking).permit(:duration, :car, :method_pay, :booking_time, :reserve_date, :address_filter)
  end
end
