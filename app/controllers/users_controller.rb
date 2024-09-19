class UsersController < ApplicationController
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

  private

  def calculate_streak(user)
    # Sample method to calculate win/loss streak
    streak = 0
    user.matches.order(created_at: :desc).each do |match|
      if match.winner == user
        streak += 1
      else
        break
      end
    end
  end
end
