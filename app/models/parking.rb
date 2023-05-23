class Parking < ApplicationRecord
  belongs_to :city_parking
  belongs_to :parking_type
end
