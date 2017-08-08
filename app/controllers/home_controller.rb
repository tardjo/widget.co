class HomeController < ApplicationController
  def index
    @upload_files = @upload_file_service.get_all(params)
  end

  def new_upload_files
  end

  def upload_files
    message = @upload_file_service.upload_files(params)

    redirect_to root_url, message
  end

  def custom_link_file
  end

  def convert_link_file
    message = @upload_file_service.convert_link_file(params)

    redirect_to root_url, message
  end
end
