class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.boolean :active
      t.string :type
      t.timestamp :time

      t.timestamps
    end
  end
end
