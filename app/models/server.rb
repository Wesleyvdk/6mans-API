class Server < ApplicationRecord
  has_many :queues, dependent: :destroy
  validates :server_id, presence: true, uniqueness: true
end
