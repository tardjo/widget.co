class AddAttachmentFileHtmlToUploadFiles < ActiveRecord::Migration
  def self.up
    change_table :upload_files do |t|
      t.attachment :file_html
    end
  end

  def self.down
    remove_attachment :upload_files, :file_html
  end
end
