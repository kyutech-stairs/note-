require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = users(:monster)
    @article = articles(:article_one)
    @like = @user.likes.build(article: @article)
  end

  test "should be valid" do
    assert @like.valid?
  end
  test "user should be presence" do
    @like.user = nil
    assert_not @like.valid?
  end
  test "article should be presence" do
    @like.article = nil
    assert_not @like.valid?
  end
end
