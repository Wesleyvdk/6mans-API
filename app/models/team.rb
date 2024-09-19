class Team < ApplicationRecord
    has_many :team_memberships, dependent: :destroy
    has_many :users
    validates :name, presence: true
end
