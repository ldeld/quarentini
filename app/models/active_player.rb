class ActivePlayer < ApplicationRecord
  belongs_to :room
  belongs_to :player
end
