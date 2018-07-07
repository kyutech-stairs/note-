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
end
