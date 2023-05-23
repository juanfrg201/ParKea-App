class CreateCityParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :city_parkings do |t|
      t.string :name

      t.timestamps
    end
  end
end
