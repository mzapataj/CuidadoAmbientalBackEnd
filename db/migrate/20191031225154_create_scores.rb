class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :cant_green_bin
      t.integer :cant_red_bin
      t.integer :cant_grey_bin
      t.integer :cant_blue_bin
      t.integer :cant_yellow_bin
      t.integer :cant_orange_bin

      t.timestamps
    end
  end
end
