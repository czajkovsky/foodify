class AddClientIdToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :client_id, :integer
  end
end
