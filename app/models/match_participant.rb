class MatchParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :match

  t.integer :score, default: 0
  t.integer :goals, default: 0
  t.integer :assists, default: 0
  t.integer :saves, default: 0
  t.integer :shots, default: 0
end
