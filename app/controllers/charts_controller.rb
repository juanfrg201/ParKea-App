class ChartsController < ApplicationController
  def export_to_pdf
    @data = Parking.all # Reemplaza "YourModel" con el nombre de tu modelo

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'chart_table',
               template: 'charts/export_to_pdf.html.erb',
               layout: 'pdf.html.erb',
               page_size: 'A4',
               orientation: 'landscape'
      end
    end
  end
end
