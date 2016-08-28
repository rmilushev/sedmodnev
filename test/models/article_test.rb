require 'test_helper'
class ArticleTest < ActiveSupport::TestCase
  # def setup
  #   @article = articles :article_1
  # end
  test 'shoud not save article without a title' do
    article = Article.new
    assert_not article.save, 'Saved an article without title'
  end

  # test 'should have article with title Article_1' do
  #   assert_equal @article.title, 'First article'
  # end

end
