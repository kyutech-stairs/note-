class ArticlesController < ApplicationController 
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])
  end
  def create
    debugger
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
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
  def correct_user
    @article = Article.find(params[:id])
    redirect_to root_path unless current_user == @article.user
  end
end
