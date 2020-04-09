class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find_by_slug(params[:slug])
    stream_from "room_#{room.slug}"

    # Broadcast new user joining:
    # ActionCable.server.broadcast 'someidentifier', action: 'subscribed', user_id: current_user.id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
