class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :plate
      t.string :car_brand
      t.references :user, null: false, foreign_key: true
      t.references :parking, null: false, foreign_key: true
      t.boolean :status
      t.date :start_hour
      t.date :finish_hour
      t.date :date

      t.timestamps
    end
  end
end
