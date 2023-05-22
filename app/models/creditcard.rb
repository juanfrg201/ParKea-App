class Creditcard < ApplicationRecord

  belongs_to :user
	belongs_to :company_credit_card

	validates :number_card, presence: true, credit_card_number: true
  validates :exp_date, presence: true


  def self.validate_credit_card(number_card: number)
		detector = CreditCardValidations::Detector.new(number_card)
		if detector.brand.present?
			if !CompanyCreditCard.find_by(name: detector.brand).present?
				company = CompanyCreditCard.create(name: detector.brand)
				return company.id
			else
				company = CompanyCreditCard.find_by(name: detector.brand)
				return company.id
			end
		end
		
	end


	private

	def create_company_card_necesary(brand_name: name)
		if !CompanyCreditCard.find_by(name: brand_name).present?
			return CompanyCreditCard.create(name: brand_name)
		else
			return CompanyCreditCard.find_by(name: brand_name)
		end
	end

end
