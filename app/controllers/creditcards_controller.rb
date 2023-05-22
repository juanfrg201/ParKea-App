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
			credit_card = Creditcard.new(name_card: credit_card_params[:name_card], number_card: num, exp_date: credit_card_params[:exp_date].to_date, user_id: current_user.id, company_credit_card_id: validator)
			if credit_card.save
				redirect_to root_path 
			end
		else
			redirect_to root_path, alert: 'No se pudo'
		end
	end

	def destroy 
		@creditcard = Creditcard.find(params[:id])
		if @creditcard.destroy
			puts "se elimino"
			redirect_to root_path
		else
			puts "no se puedo"
			redirect_to root_path
		end

	end

	private 

	def credit_card_params 
		params.require(:creditcard).permit(:name_card, :number_credit, :exp_date)
	end
end
