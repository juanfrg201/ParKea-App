class ParkingsController < ApplicationController

  before_action :authenticate_user! 

  def index
    @user = User.all
		@parkings = Parking.all
    @parking_types = ParkingType.all
    @city = CityParking.all
  end

  def new
    @parking = Parking.new
  end

  def create
    city_parking_id = CityParking.find_by(name: parking_params[:city_parking]).id
    parking_type_id = ParkingType.find_by(name: parking_params[:parking_type]).id
    @parking = Parking.new(name: parking_params[:name], rates: parking_params[:rates].to_i, spaces_available: parking_params[:total_spaces_available].to_i, availability: parking_params[:availability], tota_spaces_availble: parking_params[:total_spaces_available].to_i, address: parking_params[:address], fidelity: parking_params[:fidelity], city_parking_id: city_parking_id,
      parking_type_id: parking_type_id)
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

  private

  def parking_params 
    params.require(:parking).permit(:name, :rates, :availability, :fidelity, :address, :city_parking, :parking_type, :total_spaces_available)
  end

end
