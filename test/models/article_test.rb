require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'shoud not save article without a title' do
    article = Article.new
    assert_not article.save, 'Saved an article without title'
  end

end
