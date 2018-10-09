class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :deal_id
      t.string :user_name
      t.integer :category
      t.binary :photo1
      t.binary :photo2
      t.binary :photo3
      t.binary :photo4
      t.string :title
      t.text :explanation

      t.timestamps null: false
    end
  end
end
