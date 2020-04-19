class CreateActivePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :active_players do |t|
      t.references :room, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
