class ArticlesController < ApplicationController
  def index
    @tags = Tag.all
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).desc_order.paginate(page: params[:page], per_page: 15)
    else
      @articles = Article.importance.desc_order.paginate(page: params[:page], per_page: 17)
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
