class AddInfeasibleReasonToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :infeasible_reason, :text
  end
end
