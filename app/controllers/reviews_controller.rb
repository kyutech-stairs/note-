class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :index, :update]

  def index
    @articles = Article.where(id: current_user.purchases.map(&:article_id))
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.article = Article.find(params[:article_id])
    if @review.save
      set_flash(:notice, "reviewを更新しました")
      redirect_to action: :index
    else
      set_flash(:alert, "")
    end
  end

  def destroy

  end
  
  
  private 
  def review_params
    params.permit(:star, :title, :content)
  end
    
end
