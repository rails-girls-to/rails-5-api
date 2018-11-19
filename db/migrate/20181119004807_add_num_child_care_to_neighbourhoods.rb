class AddNumChildCareToNeighbourhoods < ActiveRecord::Migration[5.2]
  def change
    add_column :neighbourhoods, :num_child_care, :integer
  end
end
