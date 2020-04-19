class RoomsController < ApplicationController
  before_action :set_room, only: %i(show join start next_card)
  before_action :set_current_player, except: :create

  def create
    @room = Room.create!(room_params)
    @host = @room.players.first # Jut created user, need id
    @room.update(host: @host)
    session[:player_id] = @host.id
    redirect_to room_path(@room)
  end

  def show
    redirect_to join_room_path(@room) unless @current_player
    @players = @room.players.order(:id)
  end

  def start
    @room.room_card = RoomCard.create(room: @room, card: Card.random)
    @room.active_player = ActivePlayer.create!(room: @room, player: @room.players.first)
    @room.update(started: true)
    broadcast_data(action: 'gameStart')
    head :ok
  end

  def next_card
    new_card = Card.random
    @room.room_card.update(card: new_card)

    # TODO: refacto this line (useless SQL query?)
    next_player = @room.active_player.player.next
    @room.active_player.update(player: next_player)

    card_html = render_to_string(partial: "cards/card", locals: { room: @room, card: new_card })
    broadcast_data(
      action: "cardNext",
      card_body: card_html,
      active_player: { id: next_player.id, nickname: next_player.nickname }
    )
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
    params.require(:room).permit(:name, players_attributes: [:nickname])
  end
end
