class ArticlesController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    @revision = @article.revisions
  end

  def show
    @revisions = Revision.find(params[:id])
  end

end