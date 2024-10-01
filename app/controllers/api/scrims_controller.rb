
class Api::ScrimsController < ApplicationController
  def index
    @scrims = Scrim.all
    render json: @scrims
  end

  def show
    @scrim = Scrim.find(params[:id])
    render json: @scrim
  end

  def create
    @scrim = Scrim.new(scrim_params)
    @scrim.creator_id = current_user.id

    if @scrim.save
      render json: @scrim, status: :created
    else
      render json: { errors: @scrim.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def join
    @scrim = Scrim.find(params[:id])

    if @scrim.users.include?(current_user)
      render json: { error: "You are already in this scrim" }, status: :unprocessable_entity
    else
      @scrim.users << current_user
      render json: { message: "You have joined the scrim" }, status: :ok
    end
  end

  private

  def scrim_params
    params.require(:scrim).permit(:name, :team_size, :max_teams, :rank_requirement)
  end
end
