if Rails.env.production?
  CarrierWave.configure do |config|
    # config.storage = "fog/rackspace/storage"
    config.fog_credentials = {
      provider:           'Rackspace',
      rackspace_username: Figaro.env.carrierwave_user,
      rackspace_api_key:  Figaro.env.carrierwave_api_key,
      rackspace_region:   :lon
    }
    config.fog_directory = Figaro.env.fog_dir
    # config.asset_host = ENV["asset_host"]
  end
end

if Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end
