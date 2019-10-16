class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :update, :destroy]
  #before_action :authenticate_user!

  def create
    @friendship = Friendship.create!(sender: Player.find_by(user: current_user), receiver: Player.find_by(user: User.find(params[:receiver_id])), active: false)
    if @friendship.save
      render json: @friendship, status: :created
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  def update
    if @friendship.update(active: params[:active])
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
      solicitudes = Friendship.where(sender_id: Player.find_by(user: current_user)).or(Friendship.where(receiver_id: Player.find_by(user: current_user)))
      dicc = []
      solicitudes.each do |k|
        dicc2 = []
        dicc2.push({friend: k})
        dicc2.push({id: current_user.id})
        if k.sender.user == current_user
          dicc2.push({name1: Player.find(k.receiver_id).name})
        else
          dicc2.push({name1: Player.find(k.sender_id).name})
        end
        dicc.push(dicc2)
      end
      render json: dicc
    else
      render json: "User is not logged in"
    end
  end

  def friend_list
    if user_signed_in?
      lists = Friendship.where(sender_id: Player.find_by(user: current_user), active: true).or(Friendship.where(receiver_id: Player.find_by(user: current_user), active: true))
      render json: lists, status: :ok
    else
      render json: "User is not logged in"
    end
  end

  def destroy
    @friendship.delete
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:id, :sender_id, :receiver_id, :active)
    end
end
