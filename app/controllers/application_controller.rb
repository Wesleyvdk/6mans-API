class ApplicationController < ActionController::API
    before_action :authenticate_discord_user

    private

    def authenticate_discord_user
        auth_header = request.headers[ "Authorization" ]
        token = auth_header.split( " " ).last if auth_header

        if token  &&  valid_discord_token?(token)
            # Token is valid, proceed with request
        else
            render json: { error: "Unauthorized" }, status: :unauthorized
        end
    end

    def valid_discord_token?(token)
        response = HTTParty.get("https://discord.com/api/v10/users/@me", headers: {'Authorization' => "Bearer #{token}"})
        response.code == 200
    end
end
