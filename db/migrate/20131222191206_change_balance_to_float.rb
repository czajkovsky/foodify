class ChangeBalanceToFloat < ActiveRecord::Migration

  def change
    remove_column :spots, :balance
    add_column :spots, :balance, :float, null: false, default: 0
  end

end
