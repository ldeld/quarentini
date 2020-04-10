class Player < ApplicationRecord
  belongs_to :room
  has_one :hosted_room, class_name: "Room"
  validates :nickname, uniqueness: { scope: :room_id, message: "There is already a player with that name in ths room" }
end
