class AddTypeToUserWithDefaults < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, :null => false, :default => 'client'
  end
end
