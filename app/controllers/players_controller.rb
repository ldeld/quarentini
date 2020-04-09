class PlayersController < ApplicationController
  before_action :set_current_player

  def new
    @room = Room.find_by_slug(params[:slug])
    if @current_player && @current_player.room == @room
      # User already joined this room
      redirect_to room_path(@room)
    else
      @player = Player.new
    end
  end

  def create
    @room = Room.find_by_slug(params[:room_slug])
    @player = Player.new(player_params)
    @player.room = @room
    @player.save! # TODO: error handling
    session[:player_id] = @player.id
    # Broadcasting through model doesn't work rn (maybe something to do with using slug instead of ID?)
    # RoomChannel.broadcast_to(@room, action: "player_joined")
    ActionCable.server.broadcast("room_#{@room.slug}", @player.nickname)
    redirect_to room_path(@room)
  end

  private

  def player_params
    params.require(:player).permit(:nickname)
  end
end
