class FacebookAPI
  def client
    @client ||= Koala::Facebook::API.new(ENV['FACEBOOK_TOKEN'])
  end
end
