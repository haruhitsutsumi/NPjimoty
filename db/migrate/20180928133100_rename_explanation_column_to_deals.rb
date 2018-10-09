class RenameExplanationColumnToDeals < ActiveRecord::Migration
  def change
    rename_column :deals, :explanation, :deal_detail
  end
end
