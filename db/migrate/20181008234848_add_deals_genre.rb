class AddDealsGenre < ActiveRecord::Migration
  def change
    add_column:deals,:genre,:string
  end
end
