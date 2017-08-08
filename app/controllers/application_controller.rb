class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def initialize
    super
    @upload_file_service = UploadFileMeService.new
    @progress_bar_service = ProgressBarService.new
  end
end
