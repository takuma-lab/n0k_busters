class VoiceDatum < ApplicationRecord
  mount_uploader :file, AudioFileUploader
end
