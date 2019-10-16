class MovementController < ApplicationController
  before_action :authenticate_user!
  def create
    Movement.create!(game_id: params[:game_id], player_id: Player.find_by(user: current_user), coordinate1: params[:coordinate1], coordinate2: params[:coordinate2])
  end
end
