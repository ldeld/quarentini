class CreateRoomCards < ActiveRecord::Migration[6.0]
  def change
    create_table :room_cards do |t|
      t.references :room, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
