class ArticlesController < ApplicationController
  before_action :set_article, only:[:show]
  before_action :authenticate_user!, only:[:edit, :update, :destroy , :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  def index
    @articles = Article.all
  end

  def show
    # @article = current_user.articles.find(params[:id])
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

  end
  def handle_record_not_found
    # Send it to the view that is specific for Post not found
    render :not_found
  end
  private
  
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:cityname, :article , :img)
  end

end
