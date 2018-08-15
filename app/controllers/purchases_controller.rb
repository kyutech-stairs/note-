class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def create
    @purchase = current_user.purchases.build(purchase_params)
    @purchase.is_purchased = true
    @article = Article.find(params[:article_id])
    if @purchase.save
      
      if @article.purchases.count % Price.rates[@article.price.rate] == 0
        @article.update_price
        # saveに失敗した時の対処を考えないといけないかも。
        @article.save
      end
      redirect_to @article
    else
    end
  end
  private 
  def purchase_params
    params.permit(:article_id, :price)
  end
end
