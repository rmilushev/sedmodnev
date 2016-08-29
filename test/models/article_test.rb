require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def article
    @article ||= articles(:one)
  end
  test 'shoud not save article without a title' do
    article_db = Article.new
    assert_not article_db.save, 'Saved an article without title'
  end

  test 'should have article with title Article_1' do
    assert_equal article.title, 'First article'
  end
end
