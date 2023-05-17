# frozen_string_literal: true

class UploadsController < ApplicationController
  def show
    # Retrieve the filename from the URL parameter
    filename = params[:filename]
    
    # Define the directory where the uploads are stored
    uploads_directory = Rails.root.join('public', 'uploads')
    
    # Determine the file path
    file_path = File.join(uploads_directory, filename)
    
    if File.exist?(file_path)
      # If the file exists, send it as a response
      send_file file_path, disposition: 'inline'
    else
      # If the file doesn't exist, handle the error appropriately (e.g., render a 404 page)
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end
end
