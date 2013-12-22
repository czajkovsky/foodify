class ChangePriceToFloat < ActiveRecord::Migration

  def change
    remove_column :items, :price
    add_column :items, :price, :float, null: false, default: 0
  end

end
