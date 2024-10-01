class Api::QueuesController < ApplicationController
  def index
    @queues = Queue.all
    render json: @queue
  end

  def show
    @queue = Queue.find(params[:id])
    render json: @queue
  end

  def create
    @queue = Queue.new(queue_params)

    if @queue.save
      render json: @queue, status: :created
    else
      render json: { errors: @queue.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @queue = Queue.find_by(server_id: params[:server_id])
    @queue.destroy
    head :no_content
  end

  def join
    @queue = Queue.find_by(server_id: params[:server_id])
    if @queue.users.include?(current_user)
      render json: { error: "You are already in the queue" }, status: :unprocessable_entity
    else
      @queue.users << current_user
      render json: { message: "You have joined the queue" }, status: :ok
    end
  end

  def leave
    @queue = Queue.find_by(server_id: params[:server_id])
    if @queue.users.include?(current_user)
      @queue.users.delete(current_user)
      render json: { message: "You have left the queue" }, status: :ok
    else
      render json: { error: "You are not in the queue" }, status: :unprocessable_entity
    end
  end

  private

  def queue_params
    params.require(:queue).permit(:server_id, :rank_range, :queue_type)
  end
end
