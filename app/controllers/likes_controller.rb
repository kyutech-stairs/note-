class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @article = Article.find(params[:article_id])
    current_user.like(@article)
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end
  def destroy
    Like.find(params[:id]).destroy
    @article = Article.find(params[:article_id])
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end
  private
end
