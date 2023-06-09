class ExportsController < ApplicationController
  def export_to_excel_parking
    @data = Parking.all # Supongamos que tienes un modelo llamado YourModel

    Axlsx::Package.new do |p|
      p.workbook.add_worksheet(name: "Datos") do |sheet|
        # Agrega los encabezados de columna
        sheet.add_row ["Nombre", "Ciudad", "Tipo", "Espacios Disponibles", "Disponibilidad", "Total cantidad de espacios", "Direccion"]

        # Agrega los datos
        @data.each do |item|
          sheet.add_row [item.name, item.city_parking.name, item.parking_type.name, item.spaces_available, item.availability, item.tota_spaces_availble, item.address]
        end
      end

      # Generate the Excel file
      temp_file = Tempfile.new('datos.xlsx')
      p.serialize(temp_file.path)

      # Send the file as a download
      send_file temp_file.path, filename: "datos_excle_parking.xlsx", disposition: 'attachment'
    end
  end
  def export_to_excel_booking
    @data = Booking.all # Supongamos que tienes un modelo llamado YourModel

    Axlsx::Package.new do |p|
      p.workbook.add_worksheet(name: "Datos") do |sheet|
        # Agrega los encabezados de columna
        sheet.add_row ["User email", "Nombre del parqueadero", "Hora Inicio", "Hora Final", "Fecha", "Tipo de tarjeta"]

        # Agrega los datos
        @data.each do |item|
          sheet.add_row [item.user.email, item.parking.name, item.start_hour, item.finish_hour, item.date, Creditcard.find(item.creditcard_id).name_card]
        end
      end

      # Generate the Excel file
      temp_file = Tempfile.new('datos.xlsx')
      p.serialize(temp_file.path)

      # Send the file as a download
      send_file temp_file.path, filename: "datos_excle_booking.xlsx", disposition: 'attachment'
    end
  end
end
