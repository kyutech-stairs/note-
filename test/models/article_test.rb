require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @user = users(:monster)
    @article = @user.articles.build(title: "title", content: "content")
    @article.build_price
  end

  test "should be valid" do
    assert @article.valid?
  end

  test "user_id should be presence" do
    @article.user = nil
    assert_not @article.valid?
  end

  test "title should be presence" do
    @article.title = " "
    assert_not @article.valid?
  end
  test "content should be presence" do
    @article.content = " "
    assert_not @article.valid?
  end
  test "price should be presence" do
    @article.price = nil
    assert_not @article.valid?
  end

  test "associated comments should be destroy when article are destroyed" do
    @article.save
    @article.comments.create!(content: "comment", user: @user)
    assert_difference 'Comment.count', -1 do
      @article.destroy
    end
  end
  test "associated like should be destroy when article are destroyed" do
    @article.save
    @article.likes.create!(user: @user)
    assert_difference 'Like.count', -1 do
      @article.destroy
    end
  end
  test "associated bad should be destroy when article are destroyed" do
    @article.save
    @article.bads.create!(user: @user)
    assert_difference 'Bad.count', -1 do
      @article.destroy
    end
  end
  test "associated price should be destroy when article are destroyed" do
    @article.save
    assert_difference 'Price.count', -1 do
      @article.destroy
    end
  end
end
