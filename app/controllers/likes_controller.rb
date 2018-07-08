class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @article = Article.find(params[:article_id])
    current_user.like(@article)
    # if current_user.bads?(@article)
    #   current_user.cancel_bad(@article)
    # end
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end
  def destroy
    @article = Article.find(params[:article_id])
    current_user.cancel_like(@article)
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end
  private
end
