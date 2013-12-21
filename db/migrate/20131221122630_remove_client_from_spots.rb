class RemoveClientFromSpots < ActiveRecord::Migration
  def up
    remove_column :spots, :client
  end

  def down
    add_column :spots, :client, :integer
  end
end
