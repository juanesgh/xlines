class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
    render json: @players 
  end

  # GET /players/1
  # GET /players/1.json
  def show
    render json: @player
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    if Player.find_by(user: current_user) == nil
      @player = Player.create!(name: current_user.name, user:current_user)

      if @player.save
        render json: @player, status: :created
      else
        render json: @player.errors, status: :unprocessable_entity
      end
    else
      render json: "No loged in", status: :unauthorized
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :user_id)
    end
end
