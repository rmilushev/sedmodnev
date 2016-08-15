class Admin::ArticlesController < AdminController
  before_action :authenticate_admin!
  def index
    @articles = Article.all
  end
end
