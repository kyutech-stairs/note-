class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]
  before_action :correct_user, only: [:destroy, :update]
  before_action :create_before_purchase, only: [:create]

#  def index
#    @articles = Article.where(id: current_user.purchases.map(&:article_id))
#  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      set_flash(:notice, "レビューが作成されました")
    else
      set_flash(:alert, "作成に失敗しました")
    end
    @article = @review.article
    redirect_to @article
  end

  def destroy
     @review.destroy
  end

  def update
    if @review.update_attributes(review_params)
      set_flash(:notice, "レビューが更新されました")
    else
      set_flash(:alert, "更新に失敗しました")
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
  def create_before_purchase
    article = Article.find_by(params[:id])
    redirect_to root_path unless current_user.is_purchased?(Article.find(params[:article_id])) || article.price.rate=='free'
  end
end
