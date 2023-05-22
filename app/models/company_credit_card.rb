class CompanyCreditCard < ApplicationRecord
	has_many :creditcards

	validates :name, presence: { message: 'El campo debe estar presente' }
end
