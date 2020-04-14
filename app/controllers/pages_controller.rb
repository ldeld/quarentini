class PagesController < ApplicationController
  def home
    @room = Room.new
    @room.players.build
  end
end
