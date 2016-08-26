class ArticlesController < ApplicationController
  def index
    @articles = Article.desc_order.recent
  end

  def show
    @article = Article.find(params[:id])
  end
end
