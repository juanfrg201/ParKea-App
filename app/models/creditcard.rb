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

end
