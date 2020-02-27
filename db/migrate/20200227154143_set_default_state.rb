class SetDefaultState < ActiveRecord::Migration[6.0]
  def change
    change_column :reports, :state, :integer, default: 0
  end
end
