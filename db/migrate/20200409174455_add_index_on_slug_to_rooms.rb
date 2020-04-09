class AddIndexOnSlugToRooms < ActiveRecord::Migration[6.0]
  def change
    add_index :rooms, :slug, unique: true
  end
end
