class Match < ApplicationRecord
  belongs_to :queue
  has_many :match_participants
  has_many :users, through: :match_participants
end
