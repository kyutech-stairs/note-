require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  def setup
    @article = articles(:article_one)
    @price = @article.build_price
  end

  test "should be valid" do
    assert @price.valid?
  end
  test "article should be presence" do
    @price.article = nil
    assert_not @price.valid?
  end
  test "min should be presence" do
    @price.min = nil
    assert_not @price.valid?
  end
  test "max should be presence" do
    @price.max = nil
    assert_not @price.valid?
  end
  test "rate should be presence" do
    @price.rate = nil
    assert_not @price.valid?
  end
  test "min range should be inclusion correct range" do
    @price.min = 1
    assert_not @price.valid?
    @price.min = 1001
    assert_not @price.valid?
  end
  test "max range should be inclusion correct range" do
    @price.max = 1
    assert_not @price.valid?
    @price.max=5001
    assert_not @price.valid?
  end
  test "price validation method should be correctly" do
    @price.min = 1000
    @price.max = 100
    assert_not @price.valid?
    @price.min = 0
    assert_not @price.valid?
    @price.max = 0
    @price.rate = "low"
    assert_not @price.valid?
  end 
end
