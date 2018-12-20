CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAIWFW7TAWA7FDCP2A',
    aws_secret_access_key: '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',
    region: 'ap-southeast-1'
  }

  config.fog_directory  = 'stylelab-photo'
  # config.cache_storage = :fog
end
