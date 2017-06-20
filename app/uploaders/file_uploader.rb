class FileUploader < CarrierWave::Uploader::Base
  
 
  include CarrierWave
 
  storage :fog
 
  def store_dir
    "uploads/private/#{model.class.to_s.underscore}/#{model.directory}/#{model.id}"
  end
 
 
 
  
  
 
 
end