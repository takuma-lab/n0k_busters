class AudioFileUploader < CarrierWave::Uploader::Base
  storage :file
  include CarrierWave::Audio

def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 version :mp3 do
    process :convert => [{output_format: :mp3}]

    def full_filename(for_file)
      "#{super.chomp(File.extname(super))}.mp3"
    end
  end
end