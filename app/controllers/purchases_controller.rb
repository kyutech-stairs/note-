class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def create
    @purchase = current_user.purchases.find_by(article_id: params[:article_id])
    @article = Article.find(params[:article_id])
    unless @purchase
      set_flash(:alert, "購入に失敗")
      redirect_to @article
    end
    if Time.now - @purchase.updated_at <= 60
      if @purchase.update(is_purchased: true)
        if @article.purchases_count % Price.rates[@article.price.rate] == 0
          @article.update_price
          # saveに失敗した時の対処を考えないといけないかも。
          @article.save
        end
        set_flash(:notice, "購入しました")
        redirect_to @article
      else
      end
    else
      set_flash(:alert, "時間が超過しています。")
      redirect_to @article
    end
  end

  # 購入前に、購入内容を確定させる（価格が変動するため）
  def prev
    @article = Article.find(params[:article_id])
    @purchase = current_user.purchases.find_by(article_id: @article.id)
    @purchase = current_user.purchases.build(article_id: @article.id) unless @purchase
    if @purchase.update_attributes(price: @article.price.now_price, updated_at: Time.now)
    end
  end
  private 
  def purchase_params
    params.permit(:article_id, :price)
  end
end
