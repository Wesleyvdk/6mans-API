class ReplayParserJob < ApplicationJob
  queue_as :default

  def perform(file_path)
    output = `./replay_parser #{file_path}`

    # Parse the output and save the data to the database
    parsed_data = parse_output(output)

    # Save the parsed data to the database
    match = Match.create(
      replay_id: parsed_data["replay_id"],
      map: parsed_data["map"],
      duration: parsed_data["duration"],
      date_played: parsed_data["date_played"]
    )

    # Loop through each player in the parsed replay and add scoreboard data
    parsed_data["players"].each do |player_data|
      match.scoreboard.create(
        player_name: player_data["player_name"],
        goals: player_data["goals"],
        assists: player_data["assists"],
        saves: player_data["saves"],
        shots: player_data["shots"],
        score: player_data["score"]
      )
    end

    # Clean up the file after parsing
    File.delete(file_path) if File.exists?(file_path)
  end

  private

  def parse_output(output)
    # Logic to parse the CLI command output and convert it to a hash or any other format
    # For example, it could be JSON if the parser outputs that format:
    JSON.parse(output)
  end
end
