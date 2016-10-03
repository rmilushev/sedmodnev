class ArticlesController < ApplicationController
  def index
    @articles = Article.desc_order.on_top.recent
  end

  def show
    @article = Article.find(params[:id])
  end
end
