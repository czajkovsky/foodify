class AddStatusColumnToUsersWithDefaults < ActiveRecord::Migration
  def change
    add_column :users, :status, :string, null: false, default: 'out'
  end
end
