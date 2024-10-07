# app/controllers/social_accounts_controller.rb
class Api::SocialAccountsController < ApplicationController
    def index
      @social_accounts = SocialAccount.all
      render json: @social_accounts
    end
  
    def create
      @social_account = SocialAccount.new(social_account_params)
      @social_account.user_id = current_user.id # Assuming current_user is available
  
      if @social_account.save
        render json: @social_account, status: :created
      else
        render json: { errors: @social_account.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      @social_account = SocialAccount.find(params[:id])
  
      if @social_account.update(social_account_params)
        render json: @social_account
      else
        render json: { errors: @social_account.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @social_account = SocialAccount.find(params[:id])
      @social_account.destroy
      head :no_content
    end
  
    private
  
    def social_account_params
      params.require(:social_account).permit(:platform, :profile_link, :identifier)
    end
  end
