class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.boolean :active
      t.string :type
      t.timestamp :time
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
