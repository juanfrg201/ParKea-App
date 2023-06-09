class CityParkingController < ApplicationController
  before_action :authenticate_user!

  def new
    @city = CityParking.new()
  end

  def create
    @city = CityParking.new(name: city_type_params[:name])
    all_city = CityParking.all.pluck(:name)
    
    if !(all_city.map(&:upcase).include?(city_type_params[:name].upcase))
      if @city.save 
        flash[:success] = "Se registro el tipo de parqueadero"
        redirect_to parkings_path
      else
        flash[:error] = "No se pudo registrar el parqueadero]"
        redirect_to new_city_parking_path
      end
    else
      flash[:error] = "No se pudo registrar el parqueadero, revisa si ya esta creado"
      redirect_to parkings_path
    end
    
  end

  def destroy 
    @city = CityParking.find(params[:id].to_i)
    begin
      if @city.destroy
        flash[:success] = "Se elimino el tipo de parqueadero"
        redirect_to parkings_path
      else
        flash[:error] = "No se pudo eliminar el parqueadero"
        redirect_to parkings_path
      end
    rescue Exception => e
      flash[:error] = "No se pudo eliminar el parqueadero"
      redirect_to parkings_path
    end
  end

  def disable 
    @city = CityParking.find(params[:format].to_i)
    if @city.update(is_active: false)
      flash[:success] = "Se desactivo el tipo parqueadero"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudo gestionar la accion"
      redirect_to parkings_path
    end
  end 

  def enable 
    @city = CityParking.find(params[:format].to_i)
    if @city.update(is_active: true)
      flash[:success] = "Se activo el tipo parqueadero"
      redirect_to parkings_path
    else
      flash[:error] = "No se pudo gestionar la accion"
      redirect_to parkings_path
    end
  end 

  private 

  def city_type_params 
    params.require(:city_parking).permit(:name) 
  end
end
