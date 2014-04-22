CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'XXXX', #removed this secret
      :aws_secret_access_key  => 'XXXX',
  }
  config.fog_directory  = 'fiverr-cool'
  config.fog_public     = false
end
