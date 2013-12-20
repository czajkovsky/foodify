class RemoveCapacityFromSpots < ActiveRecord::Migration
  def up
    remove_column :spots, :capacity
  end

  def down
    add_column :spots, :capacity, :integer
  end
end
