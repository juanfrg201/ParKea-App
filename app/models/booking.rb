class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking
  belongs_to :client_car



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
