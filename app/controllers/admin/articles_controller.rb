class Admin::ArticlesController < AdminController
  def index
    @articles = Article.all
  end
end
