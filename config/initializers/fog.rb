CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJYEKHY3FIKKMYH7Q',
      :aws_secret_access_key  => '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',
  }
  config.fog_directory  = 'fiverr-cool'
  config.fog_public     = false
end