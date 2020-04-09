class AddStartedToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :started, :boolean, default: false
  end
end
