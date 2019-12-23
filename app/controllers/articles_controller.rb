class ArticlesController < ApplicationController
  before_action :set_article, only:[:show]
  before_action :authenticate_user!, only:[:edit, :update, :destroy , :new, :create]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @images = @article.images
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def new
    @article = current_user.articles.new
   
  end
  def create
    @article = current_user.articles.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  
  def update
    @article = current_user.articles.find(params[:id])
    @article.update(article_params)
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    redirect_to article_path(@article)
  rescue ActiveRecord::RecordNotFound  
    redirect_to :controller => "articles", :action => "index"
    return

  end

  private
  
  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound  
    redirect_to :controller => "articles", :action => "index"
    return
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:cityname, :article , :img)
  end

end
