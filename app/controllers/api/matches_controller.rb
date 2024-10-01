
class Api::MatchesController < ApplicationController
  def index
    @matches = Match.all
    render json: @matches
  end

  def show
    @match = Match.find(params[:id])
    render json: @match
  end

  def scoreboard
    @match = Match.find(params[:id])
    @participants = @match, match_participants.includes(:user)

    scoreboard_data = @participants.map do |participant|
      {
        user: participant.user.username,
        score: participant.score,
        goals: participant.goals,
        assists: participant.assists,
        saves: participant.saves,
        shots: participant.shots
      }
    end
    render json: scoreboard_data
  end
end
