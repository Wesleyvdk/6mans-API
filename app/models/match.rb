class Match < ApplicationRecord
  belongs_to :queue
  has_many :match_participants
  has_many :users, through: :match_participants

  validates :winner, inclusion: { in: %w[blue orange] }
end
