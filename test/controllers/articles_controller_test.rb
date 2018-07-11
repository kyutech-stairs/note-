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

  #create
  test "should create" do
    log_in_as @user
    assert_difference 'Article.count', 1 do
      assert_difference 'Price.count', 1 do
        post articles_path, params: 
          {article: { title: "title", content: "content",
                      price_attributes: { min: 0, max: 0, rate: "free" } } }
      end
    end
  end
  test "should redirect create when user are no logged in" do
    assert_no_difference 'Article.count' do
      assert_no_difference 'Price.count' do
        post articles_path, params: 
          {article: { title: "title", content: "content",
                      price_attributes: { min: 0, max: 0, rate: "free" } } }
      end
    end
    assert_redirected_to new_user_session_path
  end
  test "should redirect create when wrong user done" do
    log_in_as @other
    assert_difference 'Article.count', 1 do
      assert_difference 'Price.count', 1 do
        post articles_path, params: 
          {article: { title: "title", content: "content",
                      price_attributes: { min: 0, max: 0, rate: "free" } } }
      end
    end
  end

  #update
  test "should redirect update when user are no logged in" do
    patch article_path(@article), params: { article: { title: "change"}}
    assert_redirected_to new_user_session_path
  end
  test "should update when correct user done" do
    log_in_as @user
    patch article_path(@article), params: {article: {title: "change", content: "change"}}
    @article.reload
    assert @article.title == "change"
    assert @article.content == "change"
  end
  test "should redirect update when wrong user done" do
    log_in_as @other
    patch article_path(@article), params: {article: {title: "change", content: "change"}}
    assert_redirected_to root_path
  end 

  #destroy
  test "should destroy" do
    log_in_as @user
    assert_difference 'Article.count', -1 do
      assert_difference 'Price.count', -1 do
        delete article_path(@article)
      end
    end 
    assert_redirected_to root_path
  end
  test "should redirect destroy when user are no logged in" do
    assert_no_difference 'Article.count' do
      assert_no_difference 'Price.count' do
        delete article_path(@article)
      end
    end 
    assert_redirected_to new_user_session_path
  end
  test "should redirect destroy when wrong user done" do
    log_in_as @other
    assert_no_difference 'Article.count' do
      assert_no_difference 'Price.count' do
        delete article_path(@article)
      end
    end 
    assert_redirected_to root_path
  end

  
end
