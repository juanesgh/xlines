class GameStadisticsController < ApplicationController
  before_action :set_game_stadistic, only: [:show, :edit, :update, :destroy]

  # GET /game_stadistics
  # GET /game_stadistics.json
  def index
    @game_stadistics = GameStadistic.all
  end

  # GET /game_stadistics/1
  # GET /game_stadistics/1.json
  def show
  end

  # GET /game_stadistics/new
  def new
    @game_stadistic = GameStadistic.new
  end

  # GET /game_stadistics/1/edit
  def edit
  end

  # POST /game_stadistics
  # POST /game_stadistics.json
  def create
    @game_stadistic = GameStadistic.new(game_stadistic_params)

    if @game_stadistic.save
      render json: @game_stadistic, status: :created
    else
      render json: @game_stadistic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_stadistics/1
  # PATCH/PUT /game_stadistics/1.json
  def update
    if @game_stadistic.update(game_stadistics_params)
      render json: @game_stadistic
    else
      render json: @game_stadistic.errors, status: :unprocessable_entity
    end
  end

  def player_stadistics
    if user_signed_in?
      games = GameStadistics.where(player: Player.find_by(user: current_user))
      stadistics = {}
      total_games = 0
      total_squares = 0
      total_won = 0
      won_percentage = 0
      average_squares_per_game = 0
      games.each do |g|
        if g.won
          total_won += 1
        end
        total_games += 1
        total_squares += g.completed_squares
      stadistics[:total_games] = total_games
      stadistics[:total_squares] = total_squares
      stadistics[:total_won] = total_won
      stadistics[:won_percentage] = total_won/total_games
      stadistics[:average_squares_per_game] = total_squares/total_games
      
      render json: stadistics
    else
      render json: "Not signed in", status: :unauthorized
    end
  end

  # DELETE /game_stadistics/1
  # DELETE /game_stadistics/1.json
  def destroy
    @game_stadistic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_stadistic
      @game_stadistic = GameStadistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_stadistic_params
      params.require(:game_stadistic).permit(:game_id, :player_id, :completed_squares, :amount_lines, :color, :streak)
    end
end
