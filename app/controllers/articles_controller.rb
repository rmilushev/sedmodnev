class ArticlesController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    if params[:tag]
      @tag = ActsAsTaggableOn::Tag.find(params[:tag])
      @articles = Article.tagged_with(@tag.name).desc_order.paginate(page: params[:page], per_page: 15)
      # binding.pry
    else
      @articles = Article.importance.desc_order.paginate(page: params[:page], per_page: 17)
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
