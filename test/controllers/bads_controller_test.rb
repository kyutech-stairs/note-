require 'test_helper'

class BadsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:monster)
    @other = users(:cheese)
    @article = articles(:article_one)
    @bad = @user.bads.build(article_id: @article.id)
  end
  #create
  test "should create" do
    log_in_as @user
    assert_difference 'Bad.count', 1 do
      post article_bads_path(@bad, article_id: @article.id)
    end
  end
  test "should redirect create when user are no logged in" do
    assert_no_difference 'Bad.count' do
      post article_bads_path(@bad, article_id: @article.id)
    end
    assert_redirected_to new_user_session_path
  end
  #destroy
  test "should destroy" do
    log_in_as @user
    @bad.save
    assert_difference 'Bad.count', -1 do
      delete article_bad_path(@bad, article_id: @article.id)
    end
  end
  test "should redirect destroy when wrong user done" do
    @bad.save
    log_in_as @other
    assert_no_difference 'Bad.count' do
      delete article_bad_path(@bad, article_id: @article.id)
    end
    assert_redirected_to root_path
  end
  test "should redirect destroy when user are no logged in" do
    @bad.save
    assert_no_difference 'Bad.count' do
      delete article_bad_path(@bad, article_id: @article.id)
    end
    assert_redirected_to new_user_session_path
  end
end
