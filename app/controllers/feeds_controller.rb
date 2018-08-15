class FeedsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  #before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @article = Article.find(params[:article_id])
    if params[:feed] == "like"
      current_user.like(@article)
    else
      current_user.bad(@article)
    end
    @feed = current_user.feeds.find_by(article: @article)
    respond_to do |format|
      format.html {redirect_to @article}   
      format.js {}
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    current_user.cancel_feed(@article)
    respond_to do |format|
      format.html {redirect_to @article}
      format.js 
    end
  end
end
