class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def create
    Payjp.api_key = PAY_SEC_KEY
    @purchase = current_user.purchases.find_by(article_id: params[:article_id])
    @article = Article.find(params[:article_id])
    unless @purchase
      set_flash(:alert, "購入に失敗しました")
      redirect_to @article
    end
    if Time.now - @purchase.updated_at <= 180
      charge = Payjp::Charge.create(
        :amount => @purchase.price,
        :card => params[:payjpToken],
        :currency => 'jpy',
      )
      if @purchase.update(is_purchased: true)
        if @article.purchases_count % Price.rates[@article.price.rate] == 0
          @article.update_price
          # saveに失敗した時の対処を考えないといけないかも。
          @article.save
        end
        set_flash(:notice, "購入しました")
        @user = @article.user
        @user.update_sales(charge.amount)
        @user.save
        redirect_to @article
      else
      end
    else
      set_flash(:alert, "時間が超過しています。")
      redirect_to @article
    end
    rescue Payjp::CardError => e
      body = e.json_body
      err  = body[:error]
      set_flash(:alert, "カードエラー")
      redirect_to @article
    rescue Payjp::InvalidRequestError => e
      # Invalid parameters were supplied to Payjp's API
      body = e.json_body
      err  = body[:error]
      set_flash(:alert, "購入に失敗")
      redirect_to @article
    rescue Payjp::AuthenticationError => e
      # Authentication with Payjp's API failed
      # (maybe you changed API keys recently
      body = e.json_body
      err  = body[:error]
      set_flash(:alert, "購入に失敗")
      redirect_to @article
    rescue Payjp::APIConnectionError => e
      # Network communication with Payjp failed
      body = e.json_body
      err  = body[:error]
      set_flash(:alert, "購入に失敗")
      redirect_to @article
    rescue Payjp::PayjpError => e
      # Display a very generic error to the user, and maybe send
      # yourself an email
      body = e.json_body
      err  = body[:error]
      set_flash(:alert, "購入に失敗")
      redirect_to @article
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
