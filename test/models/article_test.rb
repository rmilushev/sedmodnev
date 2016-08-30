require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def article
    @article ||= articles :one
  end

  def test_valid
    assert article.valid?
  end

  test 'article has a title' do
    assert_equal article.title, 'Article numero uno'
  end
end
