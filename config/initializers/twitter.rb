twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["TW_CONSUMER_KEY"]
  config.consumer_secret = ENV["TW_CONSUMER_SECRET"]
  config.bearer_token = ENV["TW_BEARER_TOKEN"]
end
