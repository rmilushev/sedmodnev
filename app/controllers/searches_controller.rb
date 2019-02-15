class SearchesController < ApplicationController
  def index
  end

  def search
    @articles = Article.ransack(title_cont: params[:q]).result(distinct: true)
    @content  = Article.ransack(content_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {
        @articles = @articles.desc_order.paginate(page: params[:page], per_page: 11)
        @content = @content.desc_order.paginate(page: params[:page], per_page: 11)
      }

      format.json {
        @articles    = @articles.limit(5)
        @content     = @content.limit(5)
      }
    end
  end
end
