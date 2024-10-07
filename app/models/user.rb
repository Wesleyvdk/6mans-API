class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :queues
  has_many :team_memberships
  has_many :teams, through: :team_memberships
  has_many :match_participants
  has_many :matches, through: :match_participants
  has_many :platform_accounts
  has_many :social_accounts
  validates :discord_id, presence: true, uniqueness: true

  def update_stats!(match)
      # Example logic: check if the user won or lost and update the stats
      if match.winning_team == self.team_for_match(match)
        self.wins += 1
        self.streak = self.streak > 0 ? self.streak + 1 : 1 # increment or reset streak
      else
        self.losses += 1
        self.streak = self.streak < 0 ? self.streak - 1 : -1 # increment or reset losing streak
      end
      self.total_games += 1
      self.win_percentage = (wins.to_f / total_games.to_f) * 100
      self.save!
  end

  def team_for_match(match)
      match.match_participants.find_by(user_id: self.id).team
  end
end
