require 'test_helper'

class ArticleControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:cheese)
    @other = users(:monster)
    @article = articles(:article_one)
  end
  #new
  test "should get new when user logged in" do
    log_in_as @user
    get new_article_path
    assert_response :success
  end
  test "should redirect new when user are no logged in" do
    get new_article_path
    assert_redirected_to new_user_session_path
  end
  #show
  test "should get show whether user are logged in or not" do
    get article_path(@article)
    assert_response :success
    log_in_as(@user)
    get article_path(@article)
    assert_response :success
  end
  #edit
  test "should get edit when correct user logged in" do
    log_in_as @user
    get edit_article_path(@article)
    assert_response :success
  end
  test "should redirect edit when user are no logged in" do
    get edit_article_path(@article)
    assert_redirected_to new_user_session_path
  end
  test "should redirect edit when wrong user are logged in" do
    log_in_as @other
    get edit_article_path @article
    assert_redirected_to root_path
  end

  #update
  
end
