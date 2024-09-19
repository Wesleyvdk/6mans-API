class Account < ApplicationRecord
  belongs_to :user
  has_one :rank, dependent: :destroy

  validates :rl_account_id, presence: true, uniqueness: { scope: :platform }
  validates :platform, presence: true
end
