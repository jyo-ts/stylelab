CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id:
    aws_secret_access_key: 
    region: 'ap-southeast-1'
  }

  config.fog_directory  = 'stylelab-photo'
  # config.cache_storage = :fog
end



#