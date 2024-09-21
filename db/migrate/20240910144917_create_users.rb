class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :discord_id
      t.string :username
      t.integer :wins, default: 0
      t.integer :losses, default: 0
      t.integer :total_games, default: 0
      t.integer :streak, default: 0

      t.timestamps
    end
  end
end
