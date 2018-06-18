class StaticPagesController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 24, ).order("created_at DESC")
  end
  def new

  end
end
