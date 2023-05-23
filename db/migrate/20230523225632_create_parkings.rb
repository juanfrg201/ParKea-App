class CreateParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :parkings do |t|
      t.string :name
      t.references :city_parking, null: false, foreign_key: true
      t.references :parking_type, null: false, foreign_key: true
      t.integer :rates
      t.integer :spaces_available
      t.boolean :availability
      t.integer :tota_spaces_availble
      t.string :address
      t.string :fidelity

      t.timestamps
    end
  end
end
