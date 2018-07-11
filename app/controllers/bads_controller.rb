class BadsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  def create
    @article = Article.find(params[:article_id])
    current_user.bad(@article)
    # if current_user.liking?(@article)
    #   current_user.cancel_like(@article)
    # end
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end
  def destroy
    @article = Article.find(params[:article_id])
    current_user.cancel_bad(@article)
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end
  private 
  def correct_user
    bad = current_user.bads.find_by(id: params[:id])
    redirect_to root_path if bad.nil?
  end
end
