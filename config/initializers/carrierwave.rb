require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = ''
  config.fog_credentials = {
    provider: 'AWS',
    # aws_access_key_id: ENV["S3_ACCESS_KEY"],
    aws_access_key_id: '',
    # aws_secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
    aws_secret_access_key: '',
    # region: ENV["S3_RESION"],
    region: '',
    path_style: true
  }

 
end



