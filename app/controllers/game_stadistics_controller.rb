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

    respond_to do |format|
      if @game_stadistic.save
        format.html { redirect_to @game_stadistic, notice: 'Game stadistic was successfully created.' }
        format.json { render :show, status: :created, location: @game_stadistic }
      else
        format.html { render :new }
        format.json { render json: @game_stadistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_stadistics/1
  # PATCH/PUT /game_stadistics/1.json
  def update
    respond_to do |format|
      if @game_stadistic.update(game_stadistic_params)
        format.html { redirect_to @game_stadistic, notice: 'Game stadistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_stadistic }
      else
        format.html { render :edit }
        format.json { render json: @game_stadistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_stadistics/1
  # DELETE /game_stadistics/1.json
  def destroy
    @game_stadistic.destroy
    respond_to do |format|
      format.html { redirect_to game_stadistics_url, notice: 'Game stadistic was successfully destroyed.' }
      format.json { head :no_content }
    end
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
