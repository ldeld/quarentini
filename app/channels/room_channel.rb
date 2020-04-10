class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find_by_slug(params[:slug])
    stream_from "room_#{room.slug}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
