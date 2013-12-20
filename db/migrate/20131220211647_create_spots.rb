class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.integer :balance
      t.integer :client
      t.string :status
      t.integer :waiter

      t.timestamps
    end
  end
end
