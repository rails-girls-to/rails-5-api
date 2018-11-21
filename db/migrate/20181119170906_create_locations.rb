class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :neighbourhood, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
