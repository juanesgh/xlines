class GameItemsController < ApplicationController
  before_action :set_game_item, only: [:show, :edit, :update, :destroy]

  # GET /game_items
  # GET /game_items.json
  def index
    @game_items = GameItem.all
  end

  # GET /game_items/1
  # GET /game_items/1.json
  def show
  end

  # GET /game_items/new
  def new
    @game_item = GameItem.new
  end

  # GET /game_items/1/edit
  def edit
  end

  # POST /game_items
  # POST /game_items.json
  def create
    @game_item = GameItem.new(game_item_params)

    respond_to do |format|
      if @game_item.save
        format.html { redirect_to @game_item, notice: 'Game item was successfully created.' }
        format.json { render :show, status: :created, location: @game_item }
      else
        format.html { render :new }
        format.json { render json: @game_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_items/1
  # PATCH/PUT /game_items/1.json
  def update
    respond_to do |format|
      if @game_item.update(game_item_params)
        format.html { redirect_to @game_item, notice: 'Game item was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_item }
      else
        format.html { render :edit }
        format.json { render json: @game_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_items/1
  # DELETE /game_items/1.json
  def destroy
    @game_item.destroy
    respond_to do |format|
      format.html { redirect_to game_items_url, notice: 'Game item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_item
      @game_item = GameItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_item_params
      params.require(:game_item).permit(:game_id, :item_id, :active)
    end
end
