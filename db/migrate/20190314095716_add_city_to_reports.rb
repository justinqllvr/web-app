class AddCityToReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :city, foreign_key: true
  end
end
