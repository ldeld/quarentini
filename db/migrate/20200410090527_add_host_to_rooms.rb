class AddHostToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :player, foreign_key: true
  end
end
