class Room < ApplicationRecord
  before_create :generate_slug
  before_destroy :remove_host_id
  has_many :players, dependent: :destroy
  belongs_to :host, class_name: "Player", foreign_key: "player_id", optional: true


  # Override to_param to use slug instead of id in path helpers
  def to_param
    slug
  end

  private

  def generate_slug
    loop do
      self.slug = SecureRandom.hex[0..10]
      break unless Room.find_by_slug(slug)
    end
  end

  # Remove host id to avoid infinite destroy loop
  def remove_host_id
    puts "Heyy!"
    self.update(player_id: nil)
  end
end
