class TeamsController < ApplicationController
  def index
    @teams = Team.all
    render json: @teams
  end

  def show
    @team = Team.find(params[:id])
    render json: @team
  end

  def create
    @team = Team.new(team_params)
    @team.owner_id = current_user.id

    if @team.save
      render json: @team, status: :created
    else
      render json: { errors: @team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      render json: @team
    else
      render json: { errors: @team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def add_member
    @team = Team.find(params[:id])
    @user = User.find(params[:user_id])

    if @team.users.include?(@user)
      render json: { error: "User is already a team member" }, status: :unprocessable_entity
    else
      @team.users << @user
      render json: { message: "User added to the team" }, status: :ok
    end
  end

  def remove_member
    @team = Team.find(params[:id])
    @user = User.find(params[:id])

    if @team.users.include?(@user)
      @team.users.delete(@user)
      render json: { message: "User removed from the team" }, status: :ok
    else
      render json: { error: "User is not in the team" }, status: :unprocessable_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :rank_requirement)
  end
end
