class PlatformAccountsController < ApplicationController
    def index
        @platform_accounts = PlatformAccount.all
        render json: @platform_accounts
    end

    def create
        @platform_account = PlatformAccount.new(platform_account_params)
        @platform_account.user_id = current_user.id

        if @platform_account.save
            render json: @platform_account, status: :created
        else
            render json: { errors: @platform_account.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        @platform_account = PlatformAccount.find(params[:id])

        if @platform_account.update(platform_account_params)
            render json: @platform_account
        else
            render json: { errors: @platform_account.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @platform_account = PlatformAccount.find(params[:id])
        @platform_account.destroy
        head :no_content
    end

    private

    def platform_account_params
        params.require(:platform_account).permit(:platform, :profile_link, :identifier)
    end
end
