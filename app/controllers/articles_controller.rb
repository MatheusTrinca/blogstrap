class ArticlesController < ApplicationController

  before_action :set_article, only: %i[edit update show destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article 
    @article = Article.find(params[:id])
  end

end
