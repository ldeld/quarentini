class ApplicationController < ActionController::Base

  private

  def set_current_player
    @current_player = Player.find_by_id(session[:player_id])
  end
end
