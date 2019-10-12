class CreateGameStadistics < ActiveRecord::Migration[6.0]
  def change
    create_table :game_stadistics do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :completed_squares
      t.integer :amount_lines
      t.string :color
      t.integer :streak

      t.timestamps
    end
  end
end
