class UploadFileMeService
  def get_all(params)
    UploadFile.get_all(params)
  end

  def upload_files(params)
    if params[:upload_file].present? && params[:upload_file][:file].present?
      upload_file = UploadFile.new(file_html: params[:upload_file][:file])
      if upload_file.save
        {notice: 'Upload file successfully'}
      else
        {alert: 'Something when wrong : upload file failed'}
      end
    else
      {alert: 'Something when wrong : invalid parameter'}
    end
  end

  def destroy_upload_files(upload_file)
    if upload_file.present?
      if upload_file.destroy
          {notice: 'Delete file successfully'}
      else
          {alert: 'Something when wrong : delete file failed'}
      end
    else
      {alert: 'Something when wrong : invalid file'}
    end
  end

  def convert_link_file(params)
    if params[:upload_file].present? && params[:upload_file][:base_url].present? && params[:upload_file][:partner].present?
      progress_bar = ProgressBar.new(process_id: SecureRandom.urlsafe_base64(nil, false), status: 'in progress', base_url: params[:upload_file][:base_url], parameter_partner: params[:upload_file][:partner])
      if progress_bar.save
        ConvertFileJob.perform_later(params, progress_bar)
        {notice: 'Convert Link Still Progress'}
      else
        {alert: 'Something when wrong : please try again'}
      end
    else
      {alert: 'Something when wrong : invalid parameter'}
    end
  end
end
