class AddRelationshipCarToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :client_car, null: false, foreign_key: true
  end
end
