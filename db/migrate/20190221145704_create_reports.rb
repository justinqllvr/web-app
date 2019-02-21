class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :text
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
