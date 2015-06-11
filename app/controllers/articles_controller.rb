class ArticlesController < ApplicationController
  before_filter :show_latest_articles, :only => [:index, :show]

  def show_latest_articles
    @latest_articles = Article.order("id DESC")
  end
  
  
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @article = Article.find(params[:id])
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
  
  def update 
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
  
  
  
  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
