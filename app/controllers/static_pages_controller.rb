class StaticPagesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(24)
    @most_viewed = Article.order('impressions_count DESC').where("? <= created_at", Date.today.prev_day(7)).where("created_at <= ?", Time.now).take(5)
  end
  def new

  end
  def search
    @articles = Article.search(params[:keyword])
    @articles = @articles.order("created_at DESC").page(params[:article]).per(24) if @articles
  end
end
