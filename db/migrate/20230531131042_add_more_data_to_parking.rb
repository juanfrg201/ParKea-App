class AddMoreDataToParking < ActiveRecord::Migration[7.0]
  def change
    add_column :parkings, :description, :string
    add_column :parkings, :schedule, :string
    add_column :parkings, :price_minute, :string
  end
end
