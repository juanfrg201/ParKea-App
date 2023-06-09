class FidelitiesController < ApplicationController
  def index
    @fidelity_items = Fidelity.where(user_id: current_user.id)
    @fidelity = Fidelity.new
    @fidelity_validation = Parking.where(fidelity: "Si").pluck(:name, :id)
  end

  def create
    fidelity = Fidelity.new(active: create_params[:active], user_id: current_user.id, parking_id: create_params[:parking_id].to_i)
    if fidelity.save
      flash[:success] = "Se registro la fidelizacion"
      redirect_to fidelities_path
    else
      flash[:alert] = "No se pudo registrar"
      redirect_to fidelities_path
    end
  end

  def destroy
    fidelity = Fidelity.find(params[:id])
    if fidelity.destroy
      flash[:success] = "Se elimino la fidelizacion"
      redirect_to fidelities_path
    else
      flash[:alert] = "No se pudo eliminar"
      redirect_to fidelities_path
    end
  end

  def enable
    fidelity = Fidelity.find(params[:id])
    if fidelity.update(active: true)
      flash[:success] = "Se activo"
      redirect_to fidelities_path
    else
      flash[:alert] = "No se pudo eliminar"
      redirect_to fidelities_path
    end
  end

  def disable
    fidelity = Fidelity.find(params[:id])
    if fidelity.update(active: false)
      flash[:success] = "Se desactivo"
      redirect_to fidelities_path
    else
      flash[:alert] = "No se pudo eliminar"
      redirect_to fidelities_path
    end
  end

  private

  def create_params
    params.require(:fidelity).permit(:active, :user_id, :parking_id)
  end
end
