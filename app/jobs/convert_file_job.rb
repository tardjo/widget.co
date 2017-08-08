class ConvertFileJob < ActiveJob::Base
  queue_as :default

  def perform(params)
    # Do something later
    upload_files = UploadFile.all
    upload_files.each do |upload_file|
      text = File.read(upload_file.file_html.path)
      new_contents = text.gsub(params[:upload_file][:link_before], params[:upload_file][:link_after])

      # To merely print the contents of the file, use:
      puts new_contents

      # To write changes to the file, use:
      File.open(upload_file.file_html.path, "w") {|file| file.puts new_contents }
    end
  end
end
