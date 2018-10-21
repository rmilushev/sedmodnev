class Broadcaster
  def initialize(article_id)
    @article = article_id
  end

  def share
    status = ['https:/', ENV['SITE_NAME'], 'articles', @article.to_s].join('/')
    begin
      TwitterAPI.new.client.update(status)
      message = 'and twitted '
    rescue StandardError => e
      message = e.message
    end

    begin
      FacebookAPI.new.client.put_connections(ENV['FACEBOOK_PAGE_ID'], "feed", link: status)
      message = [message, '&& posted to facebook page'].join(' ')
    rescue StandardError => e
      message = [message, e.message].join(' ')
    end
  end
end
