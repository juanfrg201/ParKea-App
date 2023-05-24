class Parking < ApplicationRecord
  belongs_to :city_parking
  belongs_to :parking_type

  validates :name, presence: true
  validates :tota_spaces_availble, presence: true
  validates :spaces_available, presence: true
  
end
