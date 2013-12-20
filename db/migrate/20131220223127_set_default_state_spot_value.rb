class SetDefaultStateSpotValue < ActiveRecord::Migration
  def change
    add_column :spots, :state, :string, :null => false, :default => 'free'
    remove_column :spots, :status
  end
end
