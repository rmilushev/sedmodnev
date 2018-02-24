class SearchesController < ApplicationController
  def index
  end

  def search
    @results = Article.search_for(params[:search])
  end
end
