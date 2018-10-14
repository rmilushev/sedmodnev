class BumpImpression
  def initialize(article)
    @article = article
    @logger = Logger.new(STDOUT)
  end

  def increase
    article_stats = ArticleImpression.find_or_create_by(article_id: @article) do |stats|
      stats.article_id = @article
    end
    article_stats.increment!(:count)
    @logger.debug "Article #{@article} count increased"
  end
end
