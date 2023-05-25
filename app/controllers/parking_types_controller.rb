class ParkingTypesController < ApplicationController

  before_action :authenticate_user!

  def new
    @parking_type = ParkingType.new
  end

  def create
    @parking = ParkingType.new(name: params[:name])
    if @parking.save 
      flash[:success] = "Se registro el tipo de parqueadero"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudo registrar el parqueadero]"
      redirect_to new_parking_type_path
    end
  end

  def destroy 
    @parking = ParkingType.find(params[:id].to_i)
    if @parking.destroy
      flash[:success] = "Se elimino el tipo de parqueadero"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudo eliminar el parqueadero"
      redirect_to new_parking_type_path
    end
  end

  def disable 
    @parking = ParkingType.find(params[:format].to_i)
    if @parking.update(is_active: false)
      flash[:success] = "Se desactivo el tipo parqueadero"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudon gestionar la accion"
      redirect_to parkings_path
    end
  end 

  def enable 
    @parking = ParkingType.find(params[:format].to_i)
    if @parking.update(is_active: true)
      flash[:success] = "Se activo el tipo parqueadero"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudon gestionar la accion"
      redirect_to parkings_path
    end
  end 

  private 

  def parking_type_params 
    params.permit(:name) 
  end
end
