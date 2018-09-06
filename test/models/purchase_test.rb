require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  def setup
    @user = users(:monster)
    @article = articles(:article_one)
    @purchase = @user.purchases.new(article: @article, price: 100)
  end

  test "should be valid" do
    assert @purchase.valid?
  end
  test "should be presence in valid range" do
    @purchase.price = 99
    assert_not @purchase.valid?
    @purchase.price = 10001
    assert_not @purchase.valid?
  end
  test "user should be presence" do
    @purchase.user = nil
    assert_not @purchase.valid?
  end
  test "article should be presence" do
    @purchase.article = nil
    assert_not @purchase.valid?
  end
  test "price should be presence" do
    @purchase.price = nil
    assert_not @purchase.valid?
  end
end
