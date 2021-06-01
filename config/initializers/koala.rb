Koala.configure do |conf|
  conf.access_token = ENV['FB_ACCESS_TOKEN']
  conf.app_access_token = ENV['FB_APP_ACCESS_TOKEN']
  conf.app_id = ENV['FB_APP_ID']
  conf.app_secret = ENV['FB_APP_SECRET']
  conf.api_version = 'v3.1'
end
