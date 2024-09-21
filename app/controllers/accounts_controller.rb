class AccountsController < ApplicationController
  def index 
    @accounts = Account.all
    render json: @accounts
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id # Assuming current_user is available
    @account.username = current_user.username

    if @account.save
      render json: @account, status: :created
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @account = Account.find(params[:id])

    if @account.update(account_params)
      render json: @account
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @account = Account.find(params[:discord_id])
    @account.destroy
    head :no_content
  end

  private

  def account_params
    params.require(:account).permit(:platform, :identifier)
  end
end
