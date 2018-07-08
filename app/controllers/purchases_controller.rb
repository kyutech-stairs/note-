class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def create
    @purchase = current_user.purchases.build(purchase_params)
    @purchase.is_purchased = true
    @article = Article.find(params[:article_id])
    if @purchase.save
      redirect_to @article
    else
    end
  end
  private 
  def purchase_params
    params.permit(:article_id, :price)
  end
end
