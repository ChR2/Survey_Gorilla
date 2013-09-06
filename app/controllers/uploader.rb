class Uploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick

  
  storage :file

  def store_dir
    'images'
  end
end