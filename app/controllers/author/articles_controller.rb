module Author
  class ArticlesController < AdminController
    before_action :authenticate_admin!
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def index
      @author_articles = Article.importance.desc_order.paginate(page: params[:page], per_page: 17)
    end

    def new
      @author_article = Article.new
    end

    def edit
    end

    def create
      @author_article = Article.new(author_article_params)

      respond_to do |format|
        if @author_article.save
          message = Broadcaster.new(@author_article.id).share if Rails.env.production?
          format.html { redirect_to @author_article, notice: "Article was successfully created, #{message}." }
          format.json { render :show, status: :created, location: @author_article }
        else
          format.html { render :new, notice: @author_article.errors }
          format.json { render json: @author_article.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @author_article.update(author_article_params)
          format.html { redirect_to @author_article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @author_article }
        else
          format.html { render :edit }
          format.json { render json: @admin_article.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @author_article.destroy
      respond_to do |format|
        format.html { redirect_to author_articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_article
      @author_article = Article.find(params[:id])
    end

    def author_article_params
      params.require(:article).permit(:title, :content, :published, :main_image, :article_image, :author_id, :category_id, :golive, :importance, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
    end
  end
end
