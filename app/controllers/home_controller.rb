class HomeController < ApplicationController
  before_action :get_file, only: [:destroy_upload_files]
  def index
    @upload_files = @upload_file_service.get_all(params)
  end

  def new_upload_files
  end

  def upload_files
    message = @upload_file_service.upload_files(params)

    redirect_to root_url, message
  end

  def destroy_upload_files
    message = @upload_file_service.destroy_upload_files(@upload_file)

    redirect_to root_url, message
  end

  def custom_link_file
  end

  def convert_link_file
    message = @upload_file_service.convert_link_file(params)

    redirect_to root_url, message
  end

  def status_convert_file
    @progress_bars = @progress_bar_service.get_all(params)
  end

  private
    def get_file
      @upload_file = UploadFile.find(params[:id])
    end
end
