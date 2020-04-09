class RoomsController < ApplicationController
  def create
    @room = Room.create(room_params)
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find_by_slug(params[:slug])
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
