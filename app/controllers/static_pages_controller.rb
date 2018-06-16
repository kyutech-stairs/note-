class StaticPagesController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 32, ).order(created_at: :desc)
  end
  def new

  end
end
