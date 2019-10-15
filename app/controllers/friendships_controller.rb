class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :update, :destroy]
  #before_action :authenticate_user!

  def create
    @friendship = Friendship.create!(sender_id: current_user.id, receiver_id: User.find(params[:receiver_id]).id, active: false)
    if @friendship.save
      render json: @friendship, status: :created
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  def update
    if @friendship.update(friendship_params)
      render json: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @friendship
  end

  def list
    if user_signed_in?
      lists = Friendship.where(sender_id: current_user.id).or(Friendship.where(receiver_id: current_user.id))
      render json: lists
    else
      render json: "User is not logged in"
    end
  end 

  def destroy
    @friendship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frienship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:sender_id, :receiber_id, :active)
    end
end
