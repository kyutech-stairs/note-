class StaticPagesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(24)
  end
  def new

  end
  def search
  end
end
