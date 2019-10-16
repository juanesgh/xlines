class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    render json: @games
  end

  # GET /games/1
  # GET /games/1.json
  def show
    render json: @game
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    if user_signed_in?
      @game = Game.create!(user_id: current_user.id, active: true, type: params[:type], time: Time.now)
      if @game.save
        tmp = Time.now + 800
        Turn.create!(game: @game, turn: 1, time: tmp)
        
        GamePlayer.create!(game: @game, player: Player.find_by(user: current_user), active: true)

        render json: @game, status: :created
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    else
      render json: "NOt signed in", status: :unauthorized
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:active, :type, :time)
    end
end
