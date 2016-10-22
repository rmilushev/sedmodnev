class ArticlesController < ApplicationController
  def index
    @articles = Article.importance.desc_order.paginate(page: params[:page], per_page: 17)
  end

  def show
    @article = Article.find(params[:id])
  end
end
