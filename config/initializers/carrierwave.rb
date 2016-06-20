if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_directory = ENV["fog_dir"]
    config.asset_host = ENV["asset_host"]
    config.fog_credentials = {
      provider:           ENV["carrierwave_provider"],
      rackspace_username: ENV["carrierwave_user"],
      rackspace_api_key:  ENV["carrierwave_api_key"],
      rackspace_region:   :lon
    }
  end
end

if Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end
