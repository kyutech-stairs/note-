class StaticPagesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(24)
  end
  def new

  end
  def search
    @users = User.search(params[:keyword])
    @users = @users.page(params[:user]).per(12) if @users
    @articles = Article.search(params[:keyword]).order("created_at DESC")
    @articles = @articles.page(params[:article]).per(24) if @articles
  end
end
