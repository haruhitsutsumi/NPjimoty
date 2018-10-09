class ChangeUserTable < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    remove_column :users, :icon, :stirng
  end
end
