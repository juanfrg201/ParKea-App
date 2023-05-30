class CreateClientCars < ActiveRecord::Migration[7.0]
  def change
    create_table :client_cars do |t|
      t.string :plate
      t.string :brand
      t.string :reference

      t.timestamps
    end
  end
end
