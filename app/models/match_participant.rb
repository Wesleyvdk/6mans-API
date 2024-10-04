class MatchParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :match

  validates :team, inclusion: { in: %w[blue orange] }
end
