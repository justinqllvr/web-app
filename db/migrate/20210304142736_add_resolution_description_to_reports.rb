class AddResolutionDescriptionToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :resolution_description, :text
  end
end
