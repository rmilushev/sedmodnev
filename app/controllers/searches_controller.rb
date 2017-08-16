class SearchesController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def search
    @results = Article.search_for(params[:search])
    # @articles = Article.highlight_tsearch(params[:search]) if params[:use_highlights]
    # @articles = Article.plain_tsearch(params[:search])
    #
    # respond_to do |format|
    #   format.html { render :index }
    #   format.js { @articles }
    # end
  end
end
