class CreateOrders < ActiveRecord::Migration
  def change
    drop_table :orders
    create_table :orders do |t|
      t.integer :client_id
      t.integer :waiter_id
      t.integer :cook_id
      t.float :amount
      t.string :state
      t.references :spot

      t.timestamps
    end
    add_index :orders, :spot_id
  end
end
