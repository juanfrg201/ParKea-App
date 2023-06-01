class CityParking < ApplicationRecord
  has_many :parkings

  geocoded_by :name

  def country
    geocode_result = Geocoder.search(name).first
    geocode_result.country if geocode_result
  end

  def state
    geocode_result = Geocoder.search(name).first
    geocode_result.state if geocode_result
  end

end
