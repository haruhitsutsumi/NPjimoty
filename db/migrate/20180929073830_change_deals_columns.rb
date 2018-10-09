class ChangeDealsColumns < ActiveRecord::Migration
  def change
    remove_column:deals, :deal_id, :integer
    change_column:deals, :category, :string
  end
end
