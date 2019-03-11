class AddImageToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :picture, :string
  end
end
