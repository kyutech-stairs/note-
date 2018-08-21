class StaticPagesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(24)
  end
  def new

  end
  def search
    @users = User.search(params[:keyword])
    @articles = User.search(params[:keyword])
  end
end
