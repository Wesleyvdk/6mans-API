class Scrim < ApplicationRecord
  belongs_to :team_one, class_name: "Team"
  belongs_to :team_two, class_name: "Team"
  validates :status, inclusion: { in: %w[pending active completed] }
end
