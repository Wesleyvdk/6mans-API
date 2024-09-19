class Queue < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :server

  enum status: { active: 0, matched: 1, canceled: 2 }
  validates :queue_type, inclusion: { in: %w[intra_server cross_server] }
end
