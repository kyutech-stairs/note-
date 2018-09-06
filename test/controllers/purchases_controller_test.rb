require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:monster)
    @article = articles(:article_toll)
  end
  #create
  test "should create" do
    log_in_as @user
    assert_difference 'Purchase.count', 1 do
      get article_prev_path(article_id: @article.id), xhr: true
      post article_purchases_path(article_id: @article.id), params: { payjpToken: card_token("4242424242424242", "111", "11", "2019") }
    end
  end
  test "should redirect create when user are not logged in" do
    assert_no_difference 'Purchase.count' do
      post article_purchases_path(article_id: @article.id), params: { price: 100 }
      assert_redirected_to new_user_session_path
      log_in_as @user
    end
  end
  test "should not create because card token is used" do
    log_in_as @user
    token = card_token("4242424242424242", "111", "10", "2018") 
    get article_prev_path(article_id: @article.id), xhr: true
    post article_purchases_path(article_id: @article.id), params: { payjpToken: token}
    assert_no_difference 'Purchase.count'  do
      get article_prev_path(article_id: @article.id), xhr: true
      post article_purchases_path(article_id: @article.id), params: { payjpToken: token}
    end
  end
end
