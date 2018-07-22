class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]
  before_action :correct_user, only: [:destroy, :update]

#  def index
#    @articles = Article.where(id: current_user.purchases.map(&:article_id))
#  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      set_flash(:notice, "reviewを作成しました")
    else
      set_flash(:alert, "失敗")
    end
    @article = @review.article
    redirect_to @article
  end

  def destroy
     @review.destroy
  end
  
  def update
    if @review.update_attributes(review_params)
      set_flash(:notice, "reviewを更新しました")
    else 
      set_flash(:alert, "失敗")
    end
    @article = @review.article
    redirect_to @article
  end
  
  private 
  def review_params
    params.permit(:star, :title, :content, :article_id)
  end
  def correct_user
    @review = Review.find_by(id: params[:id])
    redirect_to root_path if !@review
  end
end
