require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:monster)
    @other = users(:cheese)
    @article = articles(:article_one)
    @like = @user.likes.build(article_id: @article.id)
  end
  #create
  test "should create" do
    log_in_as @user
    assert_difference 'Like.count', 1 do
      post article_likes_path(@like, article_id: @article.id)
    end
  end
  test "should redirect create when user are no logged in" do
    assert_no_difference 'Like.count' do
      post article_likes_path(@like, article_id: @article.id)
    end
    assert_redirected_to new_user_session_path
  end
  #destroy
  test "should destroy" do
    log_in_as @user
    @like.save
    assert_difference 'Like.count', -1 do
      delete article_like_path(@like, article_id: @article.id)
    end
  end
  test "should redirect destroy when wrong user done" do
    @like.save
    log_in_as @other
    assert_no_difference 'Like.count' do
      delete article_like_path(@like, article_id: @article.id)
    end
    assert_redirected_to root_path
  end
  test "should redirect destroy when user are no logged in" do
    @like.save
    assert_no_difference 'Like.count' do
      delete article_like_path(@like, article_id: @article.id)
    end
    assert_redirected_to new_user_session_path
  end
end
