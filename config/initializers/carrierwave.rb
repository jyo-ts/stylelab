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



# require 'carrierwave/storage/fog'


#     CarrierWave.configure do |config|
#     if Rails.env.production?
#     config.storage :fog
#     config.fog_provider = 'fog/aws'
#     config.fog_directory = 'stylelab-test-bucket'
#     config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: 'AKIAJMVD4EUHRKPRJRJQ',
#     aws_secret_access_key: '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',
#     region: 'ap-southeast-1',
#     path_style: true
#     }
#     else
#     config.storage :fog
#     config.enable_processing = false if Rails.env.test?
#     end
# end