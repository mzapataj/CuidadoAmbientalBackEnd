class CreateScore2s < ActiveRecord::Migration[6.0]
  def change
    create_table :water_scores do |t|
      t.integer :gotas
      t.integer :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
