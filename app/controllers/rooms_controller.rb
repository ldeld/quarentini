class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :join, :start]
  before_action :set_current_player, except: :create

  def create
    @room = Room.create!(room_params)
    redirect_to join_room_path(@room)
  end

  def show
    redirect_to join_room_path(@room) unless @current_player
    @players = @room.players
  end

  def start
    @room.update(started: true)
    ActionCable.server.broadcast("room_#{@room.slug}", { action: "gameStart" })
    render json: { status: 200 }
  end

  private

  def set_room
    @room = Room.find_by_slug(params[:slug])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
