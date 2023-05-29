class Parking < ApplicationRecord
  belongs_to :city_parking
  belongs_to :parking_type

  validates :name, presence: true
  validates :tota_spaces_availble, presence: true
  validates :spaces_available, presence: true

  has_many :bookings

  def validate_spaces_available 
    return spaces_available > 0 ? true : false
  end
  
end
