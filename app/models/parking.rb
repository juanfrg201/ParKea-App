class Parking < ApplicationRecord
  belongs_to :city_parking
  belongs_to :parking_type

  has_one_attached :image
  
  validates :name, presence: true
  validates :tota_spaces_availble, presence: true
  validates :spaces_available, presence: true

  has_many :bookings

  geocoded_by :address

  def validate_spaces_available 
    return spaces_available > 0 ? true : false
  end

  def postal_code
    geocode_result = Geocoder.search(address).first
    geocode_result.postal_code if geocode_result
  end

  def full_address
    street = address
    city = self.city_parking.name
    postal_code = self.postal_code
    country = self.city_parking.country
    state = self.city_parking.state
    return "#{street}, #{city}, #{postal_code}, #{country}"
  end
  
end
