class AddsDataToParkingParameters < ActiveRecord::Migration[7.0]
  def change
    add_column :parking_types, :is_active, :boolean
    add_column :city_parkings, :is_active, :boolean
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
