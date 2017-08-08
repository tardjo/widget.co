class UploadFile < ActiveRecord::Base
  has_attached_file :file_html
  validates_attachment_content_type :file_html, content_type: ['text/html']

  def self.get_all(params)
    all.order(created_at: 'desc').page(params[:page]).per(10)
  end
end
