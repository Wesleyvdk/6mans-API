class Api::ReplaysController < ApplicationController
  def create
    if params[:file].nil?
      render json: { error: "No file uploaded" }, status: :unprocessable_entity
    end

    # Save the file to a temporary location
    uploaded_file = params[:file]
    file_path = rails.root.join("tmp", "uploads", uploaded_file.original_filename)

    File.open(file_path, "wb") do |file|
      file.write(uploaded_file.read)
    end

    # Enqueue background job to parse the replay
    ReplayParserJob.perform_later(file_path.to_s)

    render json: { message: "File uploaded successfully, parsing started" }, status: :ok
  end
end
