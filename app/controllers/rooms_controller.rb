class RoomsController < ApplicationController
  before_action :set_room, only: %i(show join start next_card)
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
    @room.room_card = RoomCard.create(room: @room, card: Card.random)
    broadcast_data(action: 'gameStart')
    head :ok
  end

  def next_card
    new_card = Card.random
    @room.room_card.update(card: new_card)
    card_html = render_to_string(partial: "cards/card", locals: { room: @room, card: new_card })
    broadcast_data(action: "cardNext", body: card_html)
    head :ok
  end

  private

  def broadcast_data(data)
    ActionCable.server.broadcast("room_#{@room.slug}", data)
  end

  def set_room
    @room = Room.find_by_slug(params[:slug])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
