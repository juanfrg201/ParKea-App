class ModifiesBookingTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :plate
    remove_column :bookings, :car_brand
  end
end
