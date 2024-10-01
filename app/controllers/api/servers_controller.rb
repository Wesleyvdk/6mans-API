
class Api::ServersController < ApplicationController
  def index
    @servers = Server.all
    render json: @servers
  end

  def show
    @server = Server.find(params[:id])
  end

  def create
    @server = Server.new(server_params)

    if @server.save
      render json: @server, status: :created
    else
      render json: { errors: @server.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @server = Server.find(params[:id])

    if @server.update(server_params)
      render json: @server
    else
      render json: { errors: @servers.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @server = Server.find(params[:id])
    @server.destroy
    head :no_content
  end

  private

  def server_params
    params.require(:server).permit(:name, :region, :owner_id)
  end
end
