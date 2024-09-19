class AddOverallStatsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :wins, :integer
    add_column :users, :losses, :integer
    add_column :users, :total_games, :integer
    add_column :users, :streak, :integer
  end
end
