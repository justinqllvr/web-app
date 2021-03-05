class AddResolutionDateToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :resolution_date, :string
  end
end
