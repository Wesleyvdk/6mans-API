class Team < ApplicationRecord
    has_many :team_memberships, dependent: :destroy
    has_many :users
    has_one :owner, class_name: "User"
    validates :name, presence: true
end
