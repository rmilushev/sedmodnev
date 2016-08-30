require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def article
    @article ||= articles :one
  end

  test 'article has a title' do
    assert_equal article.title, 'Article numero uno'
  end

  test 'should not save article without title' do
    artkl = Article.new
    refute artkl.save
  end
end
