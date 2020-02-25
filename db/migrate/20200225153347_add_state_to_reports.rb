class AddStateToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :state, :int
  end
end
