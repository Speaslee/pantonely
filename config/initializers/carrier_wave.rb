CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['CARRIER_ID'],
    aws_secret_access_key: ENV['CARRIER_ACCESS_KEY']
  }
  config.fog_directory = 'pantonely'
end
