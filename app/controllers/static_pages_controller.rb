class StaticPagesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(24)
  end
  def new

  end
  def search
    @articles = Article.search(params[:keyword])
    @articles = @articles.order("created_at DESC").page(params[:article]).per(24) if @articles
  end
end
