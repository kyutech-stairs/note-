require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:monster)
    @other = users(:cheese)
    @article = articles(:article_one)
    @comment = @user.comments.build(article_id:  @article.id, content: "content")
  end
  test "should create" do
    log_in_as @user
    assert_difference 'Comment.count', 1 do
      post comments_path(), params: { comment: 
              {article_id: @comment.article_id, 
               user_id: @comment.user_id, 
               content: @comment.content}}
    end
  end
  test "should redirect create when user are no logged in " do
    assert_no_difference 'Comment.count' do
      post comments_path(), params: { comment: 
              {article_id: @comment.article_id, 
               user_id: @comment.user_id, 
               content: @comment.content}}
    end
    assert_redirected_to new_user_session_path
  end
  #destroy
  test "shoould destroy" do
    log_in_as @user
    @comment.save
    assert_difference 'Comment.count', -1 do
      delete comment_path(@comment)
    end
  end
  test "should redirect destroy when wrong user done" do
    log_in_as @other
    @comment.save
    assert_no_difference 'Comment.count' do
      delete comment_path(@comment)
    end
    assert_redirected_to root_path
  end
  test "should redirect destroy when user are no logged in" do
    @comment.save
    assert_no_difference 'Comment.count' do
      delete comment_path(@comment)
    end
    assert_redirected_to new_user_session_path
  end
end
