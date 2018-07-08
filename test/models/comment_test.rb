require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:monster)
    @article = articles(:article_one)
    @comment = @user.comments.build(article: @article, content: "comment")
  end

  test "should be valid?" do
    assert @comment.valid?
  end
  test "comment should be presence" do
    @comment.content = "   "
    assert_not @comment.valid?
  end
  test "user should be presence" do
    @comment.user = nil
    assert_not @comment.valid?
  end
  test "article should be presence" do
    @comment.article = nil
    assert_not @comment.valid?
  end
end
