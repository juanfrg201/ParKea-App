class CreditcardsController < ApplicationController
	before_action :authenticate_user!

	def index 
		@creditcard = Creditcard.all.where(user_id: current_user.id)
	end  

	def new
		@creditcard = Creditcard.new
	end

	def create
		validator = Creditcard.validate_credit_card(number_card: credit_card_params[:number_credit])
		num = credit_card_params[:number_credit]
		if validator.present?
			credit_card = Creditcard.new(alias: credit_card_params[:alias], number_card: num, exp_date: credit_card_params[:exp_date].to_date, user_id: current_user.id, company_credit_card_id: validator, is_active: true)
			if credit_card.save
				flash[:success] = "Tarjeta de credito registrada exitosamente"
				redirect_to root_path 
			end
		else
			flash[:error] = "Tarjeta no se pudo crear , revise los datos"
			redirect_to root_path, alert: 'No se pudo'
		end
	end

	def destroy 
		@creditcard = Creditcard.find(params[:id].to_i)
		if @creditcard.destroy
			flash[:success] = "Tarjeta de credito eliminada exitosamente"
			redirect_to root_path
		else
			flash[:error] = "Tarjeta no se pudo eliminar"
			redirect_to root_path
		end

	end

	private 

	def credit_card_params 
		params.require(:creditcard).permit(:alias, :number_credit, :exp_date)
	end
end
