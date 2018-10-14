class BumpViewsJob < ActiveJob::Base
  queue_as :default

  def perform(article)
    BumpImpression.new(article).increase
  end
end
