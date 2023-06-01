class ParkingsController < ApplicationController

  before_action :authenticate_user! 

  def index
    @user = User.all
		@parkings = Parking.all
    @parking_types = ParkingType.all
    @city = CityParking.all
    @addresses = Parking.all
    @address = Parking.last
  end

  def new
    @parking = Parking.new
    @parking_types = ParkingType.all.pluck(:name, :id)
    @city = CityParking.all.pluck(:name, :id)
  end

  def create
    @parking = Parking.new(name: parking_params[:name], rates: parking_params[:rates].to_i, spaces_available: parking_params[:total_spaces_available].to_i, availability: parking_params[:availability], tota_spaces_availble: parking_params[:total_spaces_available].to_i, address: parking_params[:address], fidelity: parking_params[:fidelity], city_parking_id: parking_params[:city_parking],
      parking_type_id: parking_params[:parking_type].to_i)
    @parking.image.attach(params[:parking][:image]) if params[:parking][:image]
    if @parking.save
      flash[:success] = "Se regstro el parqueadero"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudo registrar"
      redirect_to parkings_path
    end
  end

  def update
  end

  def destroy 
    @parking = Parking.find(params[:id])
    if @parking.destroy
      flash[:success] = "Se elimino el parqueadero"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudo Eliminar"
      redirect_to parkings_path
    end
  end

  def enable 
    @parking = Parking.find(params[:id])
    if @parking.update(availability: true)
      flash[:success] = "Se actualizo"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudo actualizar"
      redirect_to parkings_path
    end
  end

  def disable 
    @parking = Parking.find(params[:id])
    if @parking.update(availability: false)
      flash[:success] = "Se actualizo"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudo actualizar"
      redirect_to parkings_path
    end
  end

  def statistics 
    @parking_stats = Parking.group(:created_at).count
    filter_parking_table = params_filter[:filter_parking_table] 
    @data_parking = validate_filter_parking_functions(filter_parking_table)
    @data_booking = validate_filter_booking_functions(params_filter[:filter_booking_table])

  end

  def report 
  end

  private

  def validate_filter_parking_functions(filter_parking_table)
    case filter_parking_table
    when 'city'
      Parking.joins(:city_parking).group("city_parkings.name").count
    when 'types'
      Parking.joins(:parking_type).group("parking_types.name").count
    when 'disponibility'
      Parking.group(:availability).count
    when 'rate'
      Parking.group(:rates).count
    else 
      nil
    end
  end

  def validate_filter_booking_functions(filter_parking_table)
    case filter_parking_table
    when 'date'
      Booking.group(:date).count
    when 'parking'
      Booking.joins(:parking).group("parkings.name").count
    when 'status'
      Booking.group(:status).count
    else 
      nil
    end
  end

  def parking_params
    params.require(:parking).permit(:name, :rates, :availability, :fidelity, :address, :city_parking, :parking_type, :total_spaces_available, :image)
  end

  def params_filter
    params.permit(:filter_parking_table, :filter_booking_table) 
  end

end
