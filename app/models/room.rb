class Room < ApplicationRecord
  before_create :generate_slug

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
end
