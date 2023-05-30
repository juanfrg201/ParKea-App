class AddsRelationCreditcarToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :creditcard, null: false, foreign_key: true
  end
end
