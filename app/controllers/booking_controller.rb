class BookingController < ApplicationController
  def index
  end

  def create
    @booking = Booking.new()
    if @booking.parking_validate_reserve && @booking.parking.validate_spaces_available
      if @booking.save 
        @booking.parking.parking_reserve
      else
        flash[:error] = "No se pudo reservar el parqueadero"
      end
    else  
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
    rescue Exeption => e
      flash[:error] = "No se elimino la reserva, revisa si tiene dependencia"
    end
  end

  def enable
    @booking = Booking.find(params[:id])
    if @booking.update(status: true)
      flash[:success] = "Se activo la reserva"
    else
      flash[:error] = "No se pudon activar la reserva"
    end
  end

  def disable
  end

  def new
    @booking = Booking.new
  end

  private 

  def create_booking_params 
    params.require(:booking).permit()
  end
end
