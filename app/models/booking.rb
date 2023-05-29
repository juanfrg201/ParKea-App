class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking

  validates :plate, presence: true
  validates :car_brand, presence: true
  validates :status, presence: true
  validates :start_hour, presence: true
  validates :finish_hour, presence: true
  validates :date, presence: true

  def parking_is_active 
    validate = self.finish_hour < Date.today ? true : false
  end

  def parking_validate_reserve 
    validate = self.start_hour < self.finish_hour ? true : false
  end

  def parking_reserve
    total_spaces_available = self.spaces_available
    self.update(spaces_available: total_spaces_available - 1)
  end

end
