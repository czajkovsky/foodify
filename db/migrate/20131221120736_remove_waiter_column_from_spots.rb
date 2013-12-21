class RemoveWaiterColumnFromSpots < ActiveRecord::Migration
  def up
    remove_column :spots, :waiter
  end

  def down
    add_column :spots, :waiter, :integer
  end
end
