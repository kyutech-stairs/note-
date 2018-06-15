require 'test_helper'

class ArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get write" do
    get article_write_url
    assert_response :success
  end

end
