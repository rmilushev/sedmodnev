# module Admin
  class Admin::ArticlesController < AdminController
    before_action :authenticate_admin!
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def index
      @admin_articles = Article.desc_order
    end

    def new
      @admin_article = Admin::Article.new
    end

    # GET /articles/1/edit
    def edit
    end

    # POST /articles
    # POST /articles.json
    def create
      @admin_article = Admin::Article.new(article_params)

      respond_to do |format|
        if @admin_article.save
          format.html { redirect_to @admin_article, notice: 'Article was successfully created.' }
          format.json { render :show, status: :created, location: @admin_article }
        else
          format.html { render :new, notice: @admin_article.errors }
          format.json { render json: @admin_article.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /articles/1
    # PATCH/PUT /articles/1.json
    def update
      respond_to do |format|
        if @admin_article.update(admin_article_params)
          format.html { redirect_to @admin_article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @admin_article.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /articles/1
    # DELETE /articles/1.json
    def destroy
      @admin_article.destroy
      respond_to do |format|
        format.html { redirect_to admin_articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @admin_article = Admin::Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_article_params
      params.require(:article).permit(:title, :content, :published, :article_image, :author_id, :category_id, :golive)
    end
  end
# end
