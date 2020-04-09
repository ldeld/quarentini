class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :nickname
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
