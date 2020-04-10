class Card < ApplicationRecord

  # Returns a random record
  def self.random
    self.order("RANDOM()").limit(1).first
  end
end
