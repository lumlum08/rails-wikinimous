class ArticlesController < ApplicationController

  before_action :set_articles, except: [:index, :new, :create, :update, :distroy]

def index
  @articles = Article.all
end

def new
  @article = Article.new
end

def show
end

def create
      @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
end

  def edit
  end

  def update
    @article.update(article_params)
      if @article.save
        redirect_to articles_path
      else
        render :edit
      end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_articles
    @article = Article.find(params[:id])
  end

end
