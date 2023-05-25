class ParkingTypesController < ApplicationController

  before_action :authenticate_user!

  def new
    @parking_type = ParkingType.new
  end

  def create
    @parking = ParkingType.new(name: parking_type_params[:name])
    parking_all = ParkingType.all.pluck(:name)
    begin
      if !(parking_all.map(&:upcase).include?(parking_type_params[:name].upcase))
        if @parking.save 
          flash[:success] = "Se registro el tipo de parqueadero"
          redirect_to parkings_path
        else
          flash[:error] = "No se pudo registrar el parqueadero]"
          redirect_to new_parking_type_path
        end
      else
        flash[:error] = "El tipo de parqueadero ya esta creadp"
        redirect_to new_parking_type_path
      end
    rescue Exception => e 
      flash[:error] = "El tipo de parqueadero ya esta creadp"
      redirect_to new_parking_type_path
    end
  end

  def destroy 
    @parking = ParkingType.find(params[:id].to_i)
    begin
      if @parking.destroy
        flash[:success] = "Se elimino el tipo de parqueadero"
        redirect_to parkings_path
      else
        flash[:error] = "No se pudo eliminar el parqueadero"
        redirect_to new_parking_type_path
      end
    rescue Exception => e
      flash[:error] = "No se pudo eliminar el tipo parqueadero , revisa si esta asociedo a un parqueadero"
      redirect_to parkings_path
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
    params.require(:parking_type).permit(:name) 
  end
end
