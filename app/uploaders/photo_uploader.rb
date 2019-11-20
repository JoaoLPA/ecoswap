class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Remove everything else

  process eager: true  # Force version generation at upload time.
  process convert: 'jpg'

end
