class ConvertFileJob < ActiveJob::Base
  queue_as :default

  def perform(params, progress_bar)
    # Do something later
    upload_files = UploadFile.all
    upload_files.each do |upload_file|
      text = File.read(upload_file.file_html.path)
      doc = Nokogiri::HTML.parse(text)
      doc.css('a').each do |link|
        if link['href'].include?(params[:upload_file][:base_url])
          base_url = link.attributes["href"].value.split('?partner=')[0]

          if base_url[-1] != '/'
            new_url = (base_url.chomp('/') + '&partner=' + params[:upload_file][:partner])
          else
            new_url = (base_url.chomp('/') + '?partner=' + params[:upload_file][:partner])
          end

          link.attributes["href"].value = new_url
        end
      end

      File.open(upload_file.file_html.path, "w") {|file| file.puts doc.to_s }
      
      progress_bar.status = 'finish'
      progress_bar.save
    end
  end
end
