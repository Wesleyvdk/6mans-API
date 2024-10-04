class Api::UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def stats
    @user = User.find(params[:id])

    total_games = @user.matches.count
    total_wins = @user.matches.where(winner: @user).count
    total_losses = total_games - total_wins
    win_percentage = total_games > 0 ? (total_wins.to_f / total_games * 100).round(2) : 0
    current_streak = calculate_streak(@user)
    average_stats = get_average(@user)

    stats = {
      total_games: total_games,
      total_wins: total_wins,
      total_losses: total_losses,
      win_percentage: win_percentage,
      current_streak: current_streak
      average_stats: average_stats
    }

    render json: stats
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  def calculate_streak(user)
    streak = 0
    matches = user.match_participants.includes(:match).order('matches.created_at DESC')
    current_team = nil
    matches.each do |participant|
      if participant.match.winner == participant.team
        if current_team.nil? || current_team == participant.team
          streak += 1
          current_team = participant.team
        else 
          break
        end
      else
        break
      end
    end
  end
end

def get_average(user)
  matches = user.match_participants.includes(:match)
  total_games = matches.count
  total_score = matches.sum(:score)
  total_goals = matches.sum(:goals)
  total_assists = matches.sum(:assists)
  total_saves = matches.sum(:saves)
  total_shots = matches.sum(:shots)

  average_score = total_games > 0 ? (total_score.to_f / total_games).round(1) : 0
  average_goals = total_games > 0 ? (total_goals.to_f / total_games).round(1) : 0
  average_assists = total_games > 0 ? (total_assists.to_f / total_games).round(1) : 0
  average_saves = total_games > 0 ? (total_saves.to_f / total_games).round(1) : 0
  average_shots = total_games > 0 ? (total_shots.to_f / total_games).round(1) : 0
  {
    average_score: average_score
    average_goals: average_goals
    average_assists: average_assists
    average_saves: average_saves
    average_shots: average_shots
  }
end