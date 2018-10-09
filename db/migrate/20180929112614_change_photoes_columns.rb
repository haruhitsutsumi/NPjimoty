class ChangePhotoesColumns < ActiveRecord::Migration
  def change
        change_column:deals, :photo1, :string
        change_column:deals, :photo2, :string
        change_column:deals, :photo3, :string
        change_column:deals, :photo4, :string
  end
end
