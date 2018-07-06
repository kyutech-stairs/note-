require 'test_helper'

class BadTest < ActiveSupport::TestCase
  def setup
    @user = users(:monster)
    @article = articles(:article_one)
    @bad = @user.bads.build(article: @article)
  end

  test "should be valid" do
    assert @bad.valid?
  end
  test "user should be presence" do
    @bad.user = nil
    assert_not @bad.valid?
  end
  test "article should be presence" do
    @bad.article = nil
    assert_not @bad.valid?
  end
end
