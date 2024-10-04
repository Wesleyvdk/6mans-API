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

    stats = {
      total_games: total_games,
      total_wins: total_wins,
      total_losses: total_losses,
      win_percentage: win_percentage,
      current_streak: current_streak
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
