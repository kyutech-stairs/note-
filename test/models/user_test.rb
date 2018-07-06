require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:monster)
    @article = articles(:article_one)
    @price = prices(:price_one)
  end

  test "should be valid" do
    assert @user.valid?
  end
  test "name should be presence" do
    @user.name = "   ";
    assert_not @user.valid?
  end
  test "profile allows nil" do
    @user.profile = ""
    assert @user.valid?
  end
  test "image allows nil" do
    assert @user.valid?
    @user.image = nil
    assert @user.valid?
  end
  test "image format should be jpeg or png, gif, jpg " do
    format = ["jpeg", "jpg", "png", "gif"]
    assert format.include?(@user.image.file.original_filename.split(".")[-1])
  end

  test "associated article should be destroyed when user are destroyed" do
    @user.save
    assert_difference 'Article.count', 1 do
      @user.articles.create!(title: "title", content: "content", price: @price)
    end
    assert_difference 'Article.count', -1 do
      @user.destroy
    end

  end
  test "associated comment should be destroyed when user are destroyed" do
    @user.save
    @user.comments.create!(article: @article, content: "comment")
    assert_difference 'Comment.count', -1 do
      @user.destroy
    end
  end
  test "associated like should be destroyed when user are destroyed" do
    @user.save
    @user.likes.create!(article: @article)
    assert_difference 'Like.count', -1 do
      @user.destroy
    end
  end
  test "associated bad should be destroyed when user are destroyed" do
    @user.save
    @user.bads.create!(article: @article)
    assert_difference 'Bad.count', -1 do
      @user.destroy
    end
  end

end
