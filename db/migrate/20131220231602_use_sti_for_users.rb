class UseStiForUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, :null => false, :default => 'Client'
  end
end
