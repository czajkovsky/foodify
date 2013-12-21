class AddWaiterToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :waiter_id, :integer
  end
end
