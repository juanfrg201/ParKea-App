class ClientCarsController < ApplicationController
	before_action :authenticate_user!

	def index
    @client_cars = ClientCar.where(user_id: current_user.id)
  end

	def new
    @client_car = ClientCar.new
  end

	def create
    @client_car = ClientCar.new(client_car_params)
		@client_car.update(user_id: current_user.id)
    if @client_car.save
      redirect_to client_cars_path
			flash[:success] = "Se registro el parqueadero correctamente"
    else
			flash[:error] = "No se pudo registrar el carro"
      redirect_to client_cars_path
    end
  end

	def destroy
		@client_car = ClientCar.find(params[:id])
    if @client_car.destroy
			flash[:success] = "Se registro el parqueadero correctamente"
			redirect_to client_cars_path
		else
			flash[:error] = "No se pudo registrar"
			redirect_to client_cars_path
		end
  end

	def client_car_params
    params.permit(:plate, :brand, :reference)
  end




end
