class RenameScoreColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :scores, :cant_green_bin, :ordinario 
    rename_column :scores, :cant_red_bin, :peligroso
    rename_column :scores, :cant_grey_bin, :papel
    rename_column :scores, :cant_blue_bin, :plastico
    rename_column :scores, :cant_yellow_bin, :bombillo
    rename_column :scores, :cant_orange_bin, :pila
    add_column :scores, :value, :integer
  end
end
