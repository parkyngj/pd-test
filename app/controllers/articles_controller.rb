class ArticlesController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

  def index
    @articles = Article.all
    @search = Article.ransack(params[:q])
    @articles = @search.result
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @revised_article = Article.new(article_params)

    art_id = 

    if @revised_article.save
      @revision = Revision.create(editor_id: current_user.id, article_id: art_id, original_article_id: @article.id)

      @article.revisions << @revision
      
      p '*********************************************'
      p art_id
      p @revision
      p '*********************************************'
      redirect_to article_revisions_path(@revision.id)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to '/'
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :author_id)
    end

    # polymorphic self ? as revised article???
    # 

    # def revision_params
    #   params.require(:revision).permit(:editor_id, :article_id,:original_article_id)
    # end

end