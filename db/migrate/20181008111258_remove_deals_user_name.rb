class RemoveDealsUserName < ActiveRecord::Migration
  def change
    remove_column:deals,:user_name,:string
  end
end
