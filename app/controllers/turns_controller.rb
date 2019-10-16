class TurnsController < ApplicationController
  def change_turn
    turno = Turn.find(params[:id])
    game_id = turn.game.id
    players = GamePlayers.where(game_id)
    players_count = 0 
    players.each do |p|
      players_count += 1
    end
    if players_count >= turno.turn
      turno.turn = 1
      turno.save
    else
      turno.turn += 1
      turno.save
    end
  end
end
