class CreateNeighbourhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighbourhoods do |t|
      t.string :name
      t.integer :num_businesses
      t.decimal :home_price

      t.timestamps
    end
  end
end
