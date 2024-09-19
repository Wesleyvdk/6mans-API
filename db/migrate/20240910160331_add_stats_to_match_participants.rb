class AddStatsToMatchParticipants < ActiveRecord::Migration[7.2]
  def change
    add_column :match_participants, :score, :integer
    add_column :match_participants, :goals, :integer
    add_column :match_participants, :assists, :integer
    add_column :match_participants, :saves, :integer
    add_column :match_participants, :shots, :integer
  end
end
