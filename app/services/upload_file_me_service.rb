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

  def convert_link_file(params)
    if params[:upload_file].present? && params[:upload_file][:link_before].present? && params[:upload_file][:link_after].present?
      
    else
      {alert: 'Something when wrong : invalid parameter'}
    end
  end
end
