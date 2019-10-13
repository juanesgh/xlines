class CreateTurns < ActiveRecord::Migration[6.0]
  def change
    create_table :turns do |t|
      t.references :game, null: false, foreign_key: true
      t.timestamp :time
      t.integer :turn

      t.timestamps
    end
  end
end
