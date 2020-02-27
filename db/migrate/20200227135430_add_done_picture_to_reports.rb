class AddDonePictureToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :done_picture, :string
  end
end
