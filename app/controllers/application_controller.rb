class ApplicationController < ActionController::API
    before_action :authenticate_discord_user

    private

    def authenticate_discord_user
        auth_header = request.headers[ "Authorization" ]
        token = auth_header.split( " " ).last if auth_header

        if token  &&  valid_discord_token?(token)
            # Token is valid, proceed with request
            discord_user = fetch_discord_user(token)
            @current_user = User.find_or_create_by(discord_id: discord_user[ "id" ]) do |user| 
                user.username = discord_user["username"]
            end
        else
            render json: { error: "Unauthorized" }, status: :unauthorized
        end
    end

    def valid_discord_token?(token)
        response = HTTParty.get("https://discord.com/api/v10/users/@me",body: {
            #redirect_uri: 'http://localhost:3000/auth/discord/callback'
        }, headers: {'Authorization' => "Bearer #{token}"})
        response.code == 200
    end

    def fetch_discord_user(token)
        response = HTTParty.get("https://discord.com/api/v10/users/@me", headers: {'Authorization' => "Bearer #{token}"})
        JSON.parse(response.body)
    end

    def current_user
        @current_user
    end
end
