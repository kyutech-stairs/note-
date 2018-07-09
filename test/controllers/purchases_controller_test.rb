require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:monster)
    @article = articles(:article_one)
  end
  #create
  test "should create" do
    log_in_as @user
    assert_difference 'Purchase.count', 1 do
      post article_purchases_path(article_id: @article.id), params: { price: 100 }
    end 
  end
  test "should render create when price is 0" do
    log_in_as @user
    assert_no_difference 'Purchase.count' do
      post article_purchases_path(article_id: @article.id), params: { price: 0 }
    end 
  end
  test "should redirect create when user are not logged in" do
    assert_no_difference 'Purchase.count' do
      post article_purchases_path(article_id: @article.id), params: { price: 100 }
      assert_redirected_to new_user_session_path
      log_in_as @user
    end
  end
end
