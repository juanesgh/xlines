class AddWonToGameStadistics < ActiveRecord::Migration[6.0]
  def change
    add_column :game_stadistics, :won, :boolean
  end
end
