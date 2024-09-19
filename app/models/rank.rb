class Rank < ApplicationRecord
  belongs_to :account

  validates :rank_tier, presence: true
  validates :division, presence: true
end
