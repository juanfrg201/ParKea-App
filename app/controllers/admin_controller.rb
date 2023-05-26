class AdminController < ApplicationController
  before_action :authenticate_user! # Asegura que el usuario esté autenticado antes de acceder a las acciones
  
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create 
    role = Role.find_by(name: params_admin[:role])
    if (params_admin[:password] == params_admin[:password_confirmation]) && !(User.all.pluck(:email).include?(params_admin[:email]))
      if User.create(email: params_admin[:email], password: params[:password], role_id: role.id) 
        flash[:succes] = "Se guardo el Usuario con el rol de #{role.name}"
        redirect_to admin_index_path
      else  
        flash[:error] = "No se pudo guardar el usuario"
        redirect_to admin_index_path
      end
    else
      flash[:error] = "No se pudo guardar el usuario, revisa los datos"
      redirect_to admin_index_path
    end
  end

  def enable 
    user = User.find(params[:id])
    if user.update(status: true)
      flash[:succes] = "Se activo correctamente"
      redirect_to admin_index_path
    else  
      flash[:error] = "No se pudo activar"
      redirect_to admin_index_path
    end
  end

  def disable 
    user = User.find(params[:id])
    if user.update(status: false)
      flash[:succes] = "Se desactivo correctamente"
      redirect_to admin_index_path
    else  
      flash[:error] = "No se pudo desactivar"
      redirect_to admin_index_path
    end
  end

  def destroy 
    user = User.find(params[:id])
    begin 
      if user.destroy
        flash[:succes] = "Se elimino correctamente"
        redirect_to admin_index_path
      else  
        flash[:error] = "No se pudo eliminar"
        redirect_to admin_index_path
      end
    rescue Exception => e
      flash[:error] = "Revisa que el usuario no tenga nada asociado"
      redirect_to admin_index_path
    end
  end

  private 

  def params_admin 
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
