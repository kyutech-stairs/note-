require 'test_helper'

<<<<<<< HEAD
class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
=======
class ArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get write" do
    get article_write_url
    assert_response :success
  end

>>>>>>> b7dcce287647a543efdde2ba58ec3eb790c5096b
end
