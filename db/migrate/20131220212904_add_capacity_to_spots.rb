class AddCapacityToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :capacity, :integer
  end
end
